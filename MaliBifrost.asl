#include "AcpiTables.h"

// ARM Mali Graphic Accelerator (MALI)
Device (MALI) {
  Name (_HID, "MALI0001")
  Name (_UID, 1)
  Name (_CCA, 0)
  Name (_STA, 0xF)

  Method (_CRS, 0x0, Serialized) {
    Name (RBUF, ResourceTemplate() {
      Memory32Fixed (ReadWrite, 0xfb000000, 0x200000)
      Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 126, 125, 124 }
    })
    Return (RBUF)
  }

  Name (_DSD, Package () {
    ToUUID("0db72ea1-dd79-4d6d-941b-d7ae4ba1dfe7"),
    Package () {
      Package () { "compatible", Package () { "arm,mali-bifrost" } },
      Package () { "interrupt-names", Package () { "GPU", "MMU", "JOB" } },
    }
  })
}