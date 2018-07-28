import java.io.File

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.Future
import scala.util.Random

class SAState(initState: STLState, server: HspiceServer, firstScore: Double, conf: Config, name: String, id: Int) {
  var state = initState
  state.id = id
  var score = initState.calcScore(server) / firstScore
  var bestState = state
  var bestScore = score
  var generation = 1
  var probability = 0.0

  def moveToNextState(): Future[SAState] = {
    val nextState = state.createNeighbour()
    Future {
      val nextScore = nextState.calcScore(server) / firstScore
      if (nextScore < bestScore) {
        bestState = nextState
        bestScore = nextScore
        val dirPath = "./output/" + name + "_" + id + "/"
        val dir = new File(dirPath)
        if (!dir.exists()) dir.mkdir()
        bestState.spFile.writeToFile(dirPath + "gen" + generation + ".sp")
      }
      probability = calcProbability(score, nextScore, generation.toDouble / conf.saConf.maxItr.toDouble)
      if (Random.nextDouble() <= probability) {
        state = nextState
        score = nextScore
      }
      generation += 1
      this
    }
  }

  def calcProbability(e1: Double, e2: Double, progress: Double): Double = {
    if (e1 >= e2) 1
    else {
      val temperature = Math.pow(conf.saConf.targetTemp, progress)
      Math.pow(Math.E, (e1 - e2) / temperature)
    }
  }
}
