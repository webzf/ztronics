---
title: "I2C Address Lookup Tool"
layout: single

permalink: /tools/i2c-address-lookup/

excerpt: "Search common I2C device addresses and identify sensors, displays, RTC modules and other devices used with Arduino, ESP32 and Raspberry Pi."

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

You can search for:

- An I2C address such as `0x68`
- A device name such as `MPU6050`
- A display such as `SSD1306`
- A sensor such as `BME280`

The tool searches a database of common I2C sensors, displays, RTC modules and other devices used with Arduino, ESP32, ESP8266, Raspberry Pi and other microcontrollers.

<div class="i2c-tool">

  <div class="i2c-search-wrapper">
    <input
      type="text"
      id="i2c-search"
      placeholder="Search by device name or I2C address..."
      autocomplete="off"
    >

    <button id="i2c-clear" type="button" aria-label="Clear search">
      Clear
    </button>
  </div>

  <p class="i2c-help">
    Examples: <button type="button" class="i2c-example">MPU6050</button>
    <button type="button" class="i2c-example">0x68</button>
    <button type="button" class="i2c-example">SSD1306</button>
    <button type="button" class="i2c-example">BME280</button>
  </p>

  <div id="i2c-results-count"></div>

  <div id="i2c-results"></div>

</div>

<style>

.i2c-tool {
  max-width: 900px;
  margin: 2rem auto;
}

.i2c-search-wrapper {
  display: flex;
  gap: 10px;
  margin-bottom: 12px;
}

#i2c-search {
  width: 100%;
  padding: 15px 18px;
  font-size: 1.05rem;
  border: 1px solid #d9d9d9;
  border-radius: 8px;
  outline: none;
}

#i2c-search:focus {
  border-color: #777;
}

#i2c-clear {
  padding: 0 18px;
  border: 1px solid #d9d9d9;
  border-radius: 8px;
  background: #f5f5f5;
  cursor: pointer;
}

#i2c-clear:hover {
  background: #e9e9e9;
}

.i2c-help {
  font-size: 0.9rem;
  margin-bottom: 20px;
}

.i2c-example {
  border: none;
  background: none;
  padding: 0 3px;
  text-decoration: underline;
  cursor: pointer;
  font: inherit;
}

#i2c-results-count {
  margin-bottom: 15px;
  font-size: 0.95rem;
}

.i2c-result {
  border: 1px solid #e2e2e2;
  border-radius: 10px;
  padding: 22px;
  margin-bottom: 16px;
}

.i2c-result h2 {
  margin-top: 0;
  margin-bottom: 8px;
  font-size: 1.35rem;
}

.i2c-addresses {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin: 15px 0;
}

.i2c-address {
  display: inline-block;
  padding: 5px 10px;
  border-radius: 5px;
  background: #f2f2f2;
  font-family: monospace;
  font-weight: bold;
}

.i2c-meta {
  margin: 8px 0;
}

.i2c-meta strong {
  display: inline-block;
  min-width: 100px;
}

.i2c-links {
  margin-top: 15px;
}

.i2c-links a {
  margin-right: 15px;
}

.i2c-no-results {
  padding: 30px;
  text-align: center;
  border: 1px dashed #ccc;
  border-radius: 10px;
}

@media (max-width: 600px) {

  .i2c-search-wrapper {
    flex-direction: column;
  }

  #i2c-clear {
    padding: 12px;
  }

}

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
    devices.length + " device" + (devices.length === 1 ? "" : "s") + " found";

  if (devices.length === 0) {

    resultsContainer.innerHTML = `
      <div class="i2c-no-results">
        <strong>No matching devices found.</strong>
        <p>Try searching by device name or I2C address, for example <code>MPU6050</code> or <code>0x68</code>.</p>
      </div>
    `;

    return;
  }

  devices.forEach(device => {

    const addresses = device.addresses
      .map(address => `<span class="i2c-address">${escapeHTML(address)}</span>`)
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

    ].join(" ").toLowerCase();

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

For Arduino and ESP32 projects, see our [I2C Scanner Tutorial](/i2c-scanner-tutorial/).

---

## Common I2C Addresses

Some addresses are used by multiple devices.

For example, address `0x68` may be used by:

- MPU6050
- DS3231
- DS1307

This means that detecting `0x68` does not always identify the exact device automatically.

Always verify the device using its documentation, module markings or device identification registers.

The same situation applies to addresses such as `0x76`, `0x77` and `0x3C`, which may be used by different sensors or display controllers.

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
