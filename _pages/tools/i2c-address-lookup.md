---
title: "I2C Address Lookup Tool"
layout: single

permalink: /tools/i2c-address-lookup/

excerpt: "Search common I2C device addresses and identify sensors, displays, RTC modules and other devices used with Arduino and ESP32."

show_date: false
read_time: false
last_modified_at: false

toc: true
toc_sticky: true
toc_label: "Contents"

header:
  teaser: /assets/images/i2c-scanner-tutorial-arduino-esp32.webp
  image: /assets/images/i2c-scanner-tutorial-arduino-esp32.webp
  og_image: /assets/images/i2c-scanner-tutorial-arduino-esp32.webp

categories:
  - Tools
  - Arduino
  - ESP32

tags:
  - I2C
  - I2C Address
  - I2C Scanner
  - Arduino
  - ESP32
  - Electronics
---

# I2C Address Lookup Tool

Use this free I2C Address Lookup Tool to identify common I2C devices by their hexadecimal address or search for a device by name.

Search for:

- An I2C address such as `0x68`
- A device such as `MPU6050`
- A display such as `SSD1306`
- A sensor such as `BMA400`

<div class="i2c-tool">

  <div class="i2c-search-wrapper">

    <input
      type="text"
      id="i2c-search"
      placeholder="Search by device name or I2C address..."
      autocomplete="off"
      aria-label="Search I2C devices"
    >

    <button id="i2c-clear" type="button">
      Clear
    </button>

  </div>

  <div class="i2c-examples">
    <span>Examples:</span>

    <button type="button" class="i2c-example">MPU6050</button>
    <button type="button" class="i2c-example">0x68</button>
    <button type="button" class="i2c-example">SSD1306</button>
    <button type="button" class="i2c-example">BMA400</button>
  </div>

  <div id="i2c-results-count"></div>

  <div id="i2c-results"></div>

</div>

<style>

/* =========================================================
   Embedded Nerd - I2C Address Lookup
   ========================================================= */

.i2c-tool {
  max-width: 900px;
  margin: 2rem auto;
}

/* Search area */

.i2c-search-wrapper {
  display: flex;
  gap: 12px;
  margin-bottom: 14px;
}

#i2c-search {
  flex: 1;
  width: 100%;
  padding: 15px 18px;
  font-size: 1rem;
  font-family: inherit;
  color: inherit;
  background: transparent;
  border: 1px solid rgba(91, 194, 190, 0.55);
  border-radius: 8px;
  outline: none;
  box-sizing: border-box;
  transition: border-color 0.2s ease,
              box-shadow 0.2s ease;
}

#i2c-search::placeholder {
  opacity: 0.65;
}

#i2c-search:focus {
  border-color: #5bc2be;
  box-shadow: 0 0 0 2px rgba(91, 194, 190, 0.12);
}

/* Clear button */

#i2c-clear {
  flex: 0 0 auto;
  padding: 0 20px;
  font-family: inherit;
  font-size: 0.95rem;
  color: inherit;
  background: transparent;
  border: 1px solid rgba(91, 194, 190, 0.55);
  border-radius: 8px;
  cursor: pointer;
  transition:
    background 0.2s ease,
    border-color 0.2s ease,
    color 0.2s ease;
}

#i2c-clear:hover {
  background: rgba(91, 194, 190, 0.10);
  border-color: #5bc2be;
}

#i2c-clear:active {
  background: rgba(91, 194, 190, 0.16);
}

/* Search examples */

.i2c-examples {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 8px;
  margin-bottom: 24px;
  font-size: 0.95rem;
}

.i2c-examples > span {
  opacity: 0.75;
}

.i2c-example {
  padding: 0;
  font-family: inherit;
  font-size: inherit;
  color: #5bc2be;
  background: none;
  border: none;
  cursor: pointer;
  text-decoration: none;
  transition: color 0.2s ease;
}

.i2c-example:hover {
  color: #7bd6d2;
  text-decoration: underline;
}

/* Result count */

#i2c-results-count {
  margin-bottom: 16px;
  font-size: 0.95rem;
  opacity: 0.75;
}

/* Result cards */

.i2c-result {
  padding: 22px;
  margin-bottom: 16px;
  border: 1px solid rgba(255, 255, 255, 0.20);
  border-radius: 10px;
  background: rgba(255, 255, 255, 0.015);
}

.i2c-result h2 {
  margin-top: 0;
  margin-bottom: 12px;
  font-size: 1.35rem;
}

/* Addresses */

.i2c-addresses {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin: 14px 0 18px;
}

.i2c-address {
  display: inline-block;
  padding: 6px 11px;
  font-family: monospace;
  font-size: 0.95rem;
  font-weight: 600;
  color: #d9eeee;
  background: rgba(91, 194, 190, 0.10);
  border: 1px solid rgba(91, 194, 190, 0.35);
  border-radius: 5px;
}

/* Metadata */

.i2c-meta {
  margin: 8px 0;
}

.i2c-meta strong {
  display: inline-block;
  min-width: 105px;
}

/* Related links */

.i2c-links {
  margin-top: 18px;
  padding-top: 15px;
  border-top: 1px solid rgba(255, 255, 255, 0.12);
}

.i2c-links a {
  display: inline-block;
  margin-right: 18px;
  margin-bottom: 6px;
  color: #5bc2be;
}

.i2c-links a:hover {
  color: #7bd6d2;
}

/* No results */

.i2c-no-results {
  padding: 30px 20px;
  text-align: center;
  border: 1px dashed rgba(255, 255, 255, 0.25);
  border-radius: 10px;
}

.i2c-no-results p {
  margin-bottom: 0;
}

/* Mobile */

@media (max-width: 600px) {

  .i2c-search-wrapper {
    flex-direction: column;
  }

  #i2c-clear {
    width: 100%;
    min-height: 46px;
  }

  .i2c-examples {
    line-height: 1.8;
  }

  .i2c-result {
    padding: 20px;
  }

  .i2c-meta strong {
    display: block;
    margin-bottom: 2px;
  }

}


/* =========================================================
   End Embedded Nerd - I2C Address Lookup
   ========================================================= */

</style>

<script>

const i2cDevices = [

  {
    name: "BMA400",
    addresses: ["0x14", "0x15"],
    category: "3-Axis Accelerometer",
    manufacturer: "Bosch Sensortec",
    description: "Ultra-low-power 3-axis accelerometer with motion detection, orientation detection, step counting and activity recognition.",
    links: [
      {
        title: "BMA400 Product Page",
        url: "/products/bma400/"
      },
      {
        title: "BMA400 ESP32 Tutorial",
        url: "/bma400-esp32-tutorial-wiring-code-arduino-guide/"
      }
    ]
  },

  {
    name: "MPU6050",
    addresses: ["0x68", "0x69"],
    category: "Accelerometer & Gyroscope",
    manufacturer: "TDK InvenSense",
    description: "6-axis motion sensor combining a 3-axis accelerometer and 3-axis gyroscope.",
    links: [
      {
        title: "MPU6050 Product Page",
        url: "/products/mpu6050/"
      },
      {
        title: "MPU6050 Arduino Guide",
        url: "/mpu6050-arduino-guide/"
      },
      {
        title: "MPU6050 Calibration Guide",
        url: "/mpu6050-calibration-guide/"
      }
    ]
  },

  {
    name: "BME280",
    addresses: ["0x76", "0x77"],
    category: "Environmental Sensor",
    manufacturer: "Bosch Sensortec",
    description: "Temperature, humidity and barometric pressure sensor."
  },

  {
    name: "BMP280",
    addresses: ["0x76", "0x77"],
    category: "Pressure Sensor",
    manufacturer: "Bosch Sensortec",
    description: "Barometric pressure and temperature sensor."
  },

  {
    name: "SSD1306 OLED",
    addresses: ["0x3C", "0x3D"],
    category: "OLED Display Controller",
    manufacturer: "Solomon Systech",
    description: "Popular monochrome OLED display controller commonly used in 128x64 and 128x32 displays.",
    links: [
      {
        title: "SSD1306 OLED Product Page",
        url: "/products/ssd1306-oled/"
      },
      {
        title: "ESP32 OLED Tutorial",
        url: "/esp32-oled-tutorial-wiring-code-display-guide/"
      }
    ]
  },

  {
    name: "SH1106 OLED",
    addresses: ["0x3C", "0x3D"],
    category: "OLED Display Controller",
    manufacturer: "Sino Wealth",
    description: "Monochrome OLED display controller commonly used in small I2C OLED modules."
  },

  {
    name: "DS3231",
    addresses: ["0x68"],
    category: "Real-Time Clock",
    manufacturer: "Analog Devices",
    description: "High-accuracy real-time clock with integrated temperature-compensated crystal oscillator."
  },

  {
    name: "DS1307",
    addresses: ["0x68"],
    category: "Real-Time Clock",
    manufacturer: "Maxim Integrated",
    description: "Low-power real-time clock with calendar functions."
  },

  {
    name: "PCF8574",
    addresses: ["0x20", "0x21", "0x22", "0x23", "0x24", "0x25", "0x26", "0x27"],
    category: "I/O Expander",
    manufacturer: "NXP",
    description: "8-bit I2C GPIO expander commonly used with LCD displays and digital I/O."
  },

  {
    name: "PCF8574A",
    addresses: ["0x38", "0x39", "0x3A", "0x3B", "0x3C", "0x3D", "0x3E", "0x3F"],
    category: "I/O Expander",
    manufacturer: "NXP",
    description: "Alternate-address version of the 8-bit PCF8574 I2C GPIO expander."
  },

  {
    name: "MCP23017",
    addresses: ["0x20", "0x21", "0x22", "0x23", "0x24", "0x25", "0x26", "0x27"],
    category: "16-Bit I/O Expander",
    manufacturer: "Microchip",
    description: "16-bit I2C GPIO expander with configurable ports and interrupts."
  },

  {
    name: "ADS1115",
    addresses: ["0x48", "0x49", "0x4A", "0x4B"],
    category: "Analog-to-Digital Converter",
    manufacturer: "Texas Instruments",
    description: "16-bit precision analog-to-digital converter with four input channels."
  },

  {
    name: "ADS1015",
    addresses: ["0x48", "0x49", "0x4A", "0x4B"],
    category: "Analog-to-Digital Converter",
    manufacturer: "Texas Instruments",
    description: "12-bit analog-to-digital converter with four input channels."
  },

  {
    name: "INA219",
    addresses: ["0x40", "0x41", "0x44", "0x45"],
    category: "Current / Power Monitor",
    manufacturer: "Texas Instruments",
    description: "Current, voltage and power monitoring sensor."
  },

  {
    name: "PCA9685",
    addresses: ["0x40"],
    category: "PWM / Servo Driver",
    manufacturer: "NXP",
    description: "16-channel PWM controller commonly used for servo and LED control."
  },

  {
    name: "BH1750",
    addresses: ["0x23", "0x5C"],
    category: "Light Sensor",
    manufacturer: "ROHM",
    description: "Digital ambient light sensor."
  },

  {
    name: "HMC5883L",
    addresses: ["0x1E"],
    category: "3-Axis Magnetometer",
    manufacturer: "Honeywell",
    description: "Digital 3-axis magnetic field sensor."
  },

  {
    name: "QMC5883L",
    addresses: ["0x0D"],
    category: "3-Axis Magnetometer",
    manufacturer: "QST",
    description: "Digital 3-axis magnetic sensor commonly used as a compass module."
  },

  {
    name: "VL53L0X",
    addresses: ["0x29"],
    category: "Time-of-Flight Distance Sensor",
    manufacturer: "STMicroelectronics",
    description: "Laser-based distance sensor using time-of-flight measurement."
  },

  {
    name: "SHT31",
    addresses: ["0x44", "0x45"],
    category: "Temperature & Humidity Sensor",
    manufacturer: "Sensirion",
    description: "Digital temperature and humidity sensor."
  },

  {
    name: "CCS811",
    addresses: ["0x5A", "0x5B"],
    category: "Air Quality Sensor",
    manufacturer: "ScioSense",
    description: "Digital indoor air-quality sensor for equivalent CO2 and VOC measurements."
  },

  {
    name: "AHT20",
    addresses: ["0x38"],
    category: "Temperature & Humidity Sensor",
    manufacturer: "ASAIR",
    description: "Digital temperature and humidity sensor."
  },

  {
    name: "TCA9548A",
    addresses: ["0x70", "0x71", "0x72", "0x73", "0x74", "0x75", "0x76", "0x77"],
    category: "I2C Multiplexer",
    manufacturer: "Texas Instruments",
    description: "8-channel I2C multiplexer used to connect devices with conflicting addresses or separate I2C buses."
  }

];

const searchInput = document.getElementById("i2c-search");
const resultsContainer = document.getElementById("i2c-results");
const resultsCount = document.getElementById("i2c-results-count");
const clearButton = document.getElementById("i2c-clear");
const exampleButtons = document.querySelectorAll(".i2c-example");

function escapeHTML(value) {

  return value
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#039;");

}

function renderResults(devices) {

  resultsContainer.innerHTML = "";

  resultsCount.textContent =
    devices.length +
    " device" +
    (devices.length === 1 ? "" : "s") +
    " found";

  if (devices.length === 0) {

    resultsContainer.innerHTML = `
      <div class="i2c-no-results">
        <strong>No matching devices found.</strong>
        <p>
          Try searching by device name or I2C address,
          for example <code>MPU6050</code> or <code>0x68</code>.
        </p>
      </div>
    `;

    return;
  }

  devices.forEach(device => {

    const addresses = device.addresses
      .map(address =>
        `<span class="i2c-address">${escapeHTML(address)}</span>`
      )
      .join("");

    let links = "";

    if (device.links && device.links.length > 0) {

      links = `
        <div class="i2c-links">
          ${device.links.map(link =>
            `<a href="${link.url}">${escapeHTML(link.title)} →</a>`
          ).join("")}
        </div>
      `;

    }

    resultsContainer.innerHTML += `
      <article class="i2c-result">

        <h2>${escapeHTML(device.name)}</h2>

        <div class="i2c-addresses">
          ${addresses}
        </div>

        <p class="i2c-meta">
          <strong>Type:</strong>
          ${escapeHTML(device.category)}
        </p>

        <p class="i2c-meta">
          <strong>Manufacturer:</strong>
          ${escapeHTML(device.manufacturer)}
        </p>

        <p>
          ${escapeHTML(device.description)}
        </p>

        ${links}

      </article>
    `;

  });

}

function searchDevices() {

  const query = searchInput.value
    .trim()
    .toLowerCase();

  if (!query) {

    renderResults(i2cDevices);
    return;

  }

  const filteredDevices = i2cDevices.filter(device => {

    const searchableText = [
      device.name,
      device.category,
      device.manufacturer,
      device.description,
      ...device.addresses
    ]
      .join(" ")
      .toLowerCase();

    return searchableText.includes(query);

  });

  renderResults(filteredDevices);

}

searchInput.addEventListener("input", searchDevices);

clearButton.addEventListener("click", function() {

  searchInput.value = "";
  searchInput.focus();

  renderResults(i2cDevices);

});

exampleButtons.forEach(button => {

  button.addEventListener("click", function() {

    searchInput.value = this.textContent.trim();

    searchDevices();

    searchInput.focus();

  });

});

renderResults(i2cDevices);

</script>

---

## How to Find an I2C Device Address

The easiest way to identify an unknown I2C device address is to run an I2C scanner.

An I2C scanner checks the available addresses on the bus and reports devices that respond.

See our [I2C Scanner Tutorial](/i2c-scanner-tutorial/) for a practical Arduino and ESP32 example.

---

## Common I2C Addresses

Some I2C addresses are used by multiple devices.

For example, `0x68` may be used by:

- MPU6050
- DS3231
- DS1307

Therefore, detecting an address does not always uniquely identify the device.

Always verify the device using its documentation, module markings or identification registers.

---

## What If Two Devices Use the Same I2C Address?

Two devices with the same fixed I2C address cannot normally communicate independently on the same I2C bus.

Possible solutions include:

- Changing the address using an address pin or jumper
- Using a second I2C bus
- Using an I2C multiplexer such as the TCA9548A
- Selecting a different sensor or module

Before changing your wiring or code, use an I2C scanner to confirm which addresses are currently active.

---

## Related Tutorials

- [I2C Scanner Tutorial](/i2c-scanner-tutorial/)
- [MPU6050 Arduino Guide](/mpu6050-arduino-guide/)
- [MPU6050 Calibration Guide](/mpu6050-calibration-guide/)
- [BMA400 ESP32 Tutorial](/bma400-esp32-tutorial-wiring-code-arduino-guide/)
- [ESP32 OLED Tutorial](/esp32-oled-tutorial-wiring-code-display-guide/)
