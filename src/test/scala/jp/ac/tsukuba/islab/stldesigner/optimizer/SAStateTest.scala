package jp.ac.tsukuba.islab.stldesigner.optimizer

import jp.ac.tsukuba.islab.stldesigner.circuit.{CommandRunner, ExecResult, HspiceServer, SPFile}
import jp.ac.tsukuba.islab.stldesigner.util.ConfigReader
import org.scalamock.scalatest.MockFactory
import org.scalatest.{DiagrammedAssertions, FlatSpec}

import scala.concurrent.Await
import scala.concurrent.duration.Duration

class SAStateTest extends FlatSpec with DiagrammedAssertions with MockFactory {
  val cmdr: CommandRunner = stub[CommandRunner]
  (cmdr.runCommand _).when(*).returns(ExecResult(0, Seq(), Seq()))
  val conf = ConfigReader().getFromYAML(getClass().getResource("/config/test_sa.yml").getPath)
  val server: HspiceServer = stub[MockableSPServer]
  val saState = new SAState(new STLStateMock(), conf, "test", 0)

  class STLStateMock extends STLState(SPFile(conf), conf, server, 0) {
    override def calcScore(): Double = 1.0

    override def createNeighbour(): STLState = this

    override def createRandom(): STLState = this
  }

  class MockableSPServer extends HspiceServer(cmdr, conf)

  "moveToNextState()" should "change state." in {
    val future = saState.moveToNextState()
    val newState = Await.result(future, Duration.Inf)
    assert(newState.generation === 2)
  }

  "calcProbability()" should "return one if e1 is grater than e2" in {
    assert(saState.calcProbability(1.0, 0.5, 0.5) === 1)
  }

  "calcPprobability()" should "return probability of the Simulated Annealing" in {
    assert(saState.calcProbability(0.5, 1.0, 0.5) === 0.006737946999085469)
  }
}
