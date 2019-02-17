package jp.ac.tsukuba.islab.stldesigner.runner

import jp.ac.tsukuba.islab.stldesigner.optimizer.{STLState, SimulatedAnnealing}
import jp.ac.tsukuba.islab.stldesigner.circuit.{CommandRunner, HspiceServer, SPFile}
import jp.ac.tsukuba.islab.stldesigner.util.ConfigReader

object STLRunner {
  def main(args: Array[String]) {
    if (args.size == 1) {
      println("Init servers.")
      val conf = ConfigReader().getFromYAML(args(0))
      val server = new HspiceServer(new CommandRunner(), conf)
      val firstScore = STLState(SPFile(conf), conf, server, 0).calcFirstScore()
      val firstState = STLState(SPFile(conf), conf, server, 0, firstScore)
      val sa = SimulatedAnnealing(firstState, conf)
      sa.run()
      println("Close servers.")
      server.close()
    } else {
      println("Invalid args. Format: sbt \"run [config path]\"")
    }
  }
}
