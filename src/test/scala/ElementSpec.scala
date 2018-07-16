import org.scalatest._

import scala.collection.mutable

class ElementSpec extends FlatSpec with DiagrammedAssertions with Matchers {
  val element = WElement(
    "W1_SEG_1",
    Array("102", "0", "optpt1", "0"),
    mutable.LinkedHashMap("RLGCMODEL" -> "Z50", "N" -> "1", "L" -> "100m"), new Config())

  "WElement.getString()" should "return spice line." in {
    assert(element.getString() === "W1_SEG_1 102 0 optpt1 0 RLGCMODEL=Z50 N=1 L=100m")
  }

  "WElement.shift()" should "return shifted element." in {
    assert(element.shift().getString() != "W1_SEG_1 102 0 optpt1 0 RLGCMODEL=Z50 N=1 L=100m")
  }
}