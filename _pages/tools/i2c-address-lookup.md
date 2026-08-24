---
title: "I2C Address Lookup & Compatibility Tool"
layout: single

permalink: /tools/i2c-address-lookup/

excerpt: "Free I2C address lookup and compatibility checker for Arduino, ESP32 and Raspberry Pi. Find device addresses and check for I2C bus conflicts."

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
  - I2C Compatibility
  - Arduino
  - ESP32
  - Electronics
---

# I2C Address Lookup & Compatibility Tool

Use this free I2C tool to find common I2C device addresses and check whether multiple devices can share the same I2C bus.

Search for a device such as `MPU6050`, search by address such as `0x68`, or select several devices to check for address conflicts.

<div class="i2c-tool">

  <div class="i2c-section">

    <h2>I2C Address Lookup</h2>

    <div class="i2c-search-wrapper">

      <input
        type="text"
        id="i2c-search"
        placeholder="Search device name or I2C address..."
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


  <div class="i2c-section compatibility-section">

    <h2>I2C Compatibility Checker</h2>

    <p>
      Select two or more devices to check whether their I2C addresses conflict.
    </p>

    <div class="i2c-selector-row">

      <select id="i2c-device-select">

        <option value="">Select a device...</option>

      </select>

      <button id="i2c-add-device" type="button">
        + Add Device
      </button>

    </div>

    <div id="i2c-selected-devices"></div>

    <div id="i2c-compatibility-result"></div>

  </div>

</div>


<style>

/* =========================================================
   Embedded Nerd - I2C Address & Compatibility Tool
   ========================================================= */

.i2c-tool {
  max-width: 900px;
  margin: 2rem auto;
}

.i2c-section {
  margin-bottom: 3rem;
}

.i2c-section h2 {
  margin-top: 0;
}

/* Search */

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
}

#i2c-search:focus {
  border-color: #5bc2be;
  box-shadow: 0 0 0 2px rgba(91, 194, 190, 0.12);
}

#i2c-search::placeholder {
  opacity: 0.65;
}

/* Buttons */

#i2c-clear,
#i2c-add-device {
  padding: 12px 18px;
  font-family: inherit;
  font-size: 0.95rem;
  color: inherit;
  background: transparent;
  border: 1px solid rgba(91, 194, 190, 0.55);
  border-radius: 8px;
  cursor: pointer;
  transition:
    background 0.2s ease,
    border-color 0.2s ease;
}

#i2c-clear:hover,
#i2c-add-device:hover {
  background: rgba(91, 194, 190, 0.10);
  border-color: #5bc2be;
}

/* Examples */

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
}

.i2c-example:hover {
  color: #7bd6d2;
  text-decoration: underline;
}

/* Results */

#i2c-results-count {
  margin-bottom: 16px;
  font-size: 0.95rem;
  opacity: 0.75;
}

.i2c-result {
  padding: 22px;
  margin-bottom: 16px;
  border: 1px solid rgba(255, 255, 255, 0.20);
  border-radius: 10px;
  background: rgba(255, 255, 255, 0.015);
}

.i2c-result h3 {
  margin-top: 0;
}

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

.i2c-meta {
  margin: 8px 0;
}

.i2c-meta strong {
  display: inline-block;
  min-width: 105px;
}

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

/* Compatibility */

.compatibility-section {
  padding-top: 10px;
}

.i2c-selector-row {
  display: flex;
  gap: 12px;
  margin: 20px 0;
}

#i2c-device-select {
  flex: 1;
  min-height: 46px;
  padding: 10px 14px;
  font-family: inherit;
  font-size: 1rem;
  color: inherit;
  background: transparent;
  border: 1px solid rgba(91, 194, 190, 0.55);
  border-radius: 8px;
}

#i2c-device-select option {
  color: #111;
  background: #fff;
}

.i2c-selected-device {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 15px;
  padding: 14px 16px;
  margin-bottom: 10px;
  border: 1px solid rgba(255, 255, 255, 0.18);
  border-radius: 8px;
}

.i2c-selected-info strong {
  display: block;
  margin-bottom: 5px;
}

.i2c-selected-address {
  font-family: monospace;
  font-size: 0.9rem;
  opacity: 0.75;
}

.i2c-remove {
  padding: 6px 10px;
  color: inherit;
  background: transparent;
  border: 1px solid rgba(255, 255, 255, 0.25);
  border-radius: 6px;
  cursor: pointer;
}

.i2c-remove:hover {
  border-color: #5bc2be;
}

.i2c-status {
  padding: 20px;
  margin-top: 20px;
  border-radius: 10px;
}

.i2c-status-ok {
  border: 1px solid rgba(91, 194, 190, 0.45);
  background: rgba(91, 194, 190, 0.08);
}

.i2c-status-warning {
  border: 1px solid rgba(230, 180, 70, 0.55);
  background: rgba(230, 180, 70, 0.08);
}

.i2c-status-conflict {
  border: 1px solid rgba(220, 90, 90, 0.55);
  background: rgba(220, 90, 90, 0.08);
}

.i2c-status h3 {
  margin-top: 0;
}

.i2c-conflict {
  margin-top: 15px;
  padding: 14px;
  border-radius: 7px;
  background: rgba(220, 90, 90, 0.08);
}

.i2c-solution {
  margin-top: 15px;
}

/* No results */

.i2c-no-results {
  padding: 30px 20px;
  text-align: center;
  border: 1px dashed rgba(255, 255, 255, 0.25);
  border-radius: 10px;
}

/* Mobile */

@media (max-width: 600px) {

  .i2c-search-wrapper,
  .i2c-selector-row {
    flex-direction: column;
  }

  #i2c-clear,
  #i2c-add-device {
    width: 100%;
  }

  .i2c-selected-device {
    align-items: flex-start;
  }

  .i2c-meta strong {
    display: block;
    margin-bottom: 2px;
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
    description: "High-accuracy real-time clock with temperature-compensated crystal oscillator."
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
    addresses: [
      "0x20","0x21","0x22","0x23",
      "0x24","0x25","0x26","0x27"
    ],
    category: "I/O Expander",
    manufacturer: "NXP",
    description: "8-bit I2C GPIO expander commonly used with LCD displays and digital I/O."
  },

  {
    name: "PCF8574A",
    addresses: [
      "0x38","0x39","0x3A","0x3B",
      "0x3C","0x3D","0x3E","0x3F"
    ],
    category: "I/O Expander",
    manufacturer: "NXP",
    description: "Alternate-address version of the PCF8574 I2C GPIO expander."
  },

  {
    name: "MCP23017",
    addresses: [
      "0x20","0x21","0x22","0x23",
      "0x24","0x25","0x26","0x27"
    ],
    category: "16-Bit I/O Expander",
    manufacturer: "Microchip",
    description: "16-bit I2C GPIO expander with configurable ports and interrupts."
  },

  {
    name: "ADS1115",
    addresses: ["0x48","0x49","0x4A","0x4B"],
    category: "Analog-to-Digital Converter",
    manufacturer: "Texas Instruments",
    description: "16-bit precision analog-to-digital converter with four input channels."
  },

  {
    name: "ADS1015",
    addresses: ["0x48","0x49","0x4A","0x4B"],
    category: "Analog-to-Digital Converter",
    manufacturer: "Texas Instruments",
    description: "12-bit analog-to-digital converter with four input channels."
  },

  {
    name: "INA219",
    addresses: ["0x40","0x41","0x44","0x45"],
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
    addresses: ["0x23","0x5C"],
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
    addresses: ["0x44","0x45"],
    category: "Temperature & Humidity Sensor",
    manufacturer: "Sensirion",
    description: "Digital temperature and humidity sensor."
  },

  {
    name: "CCS811",
    addresses: ["0x5A","0x5B"],
    category: "Air Quality Sensor",
    manufacturer: "ScioSense",
    description: "Digital indoor air-quality sensor."
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
    addresses: [
      "0x70","0x71","0x72","0x73",
      "0x74","0x75","0x76","0x77"
    ],
    category: "I2C Multiplexer",
    manufacturer: "Texas Instruments",
    description: "8-channel I2C multiplexer used to connect devices with conflicting addresses."
  }

];


const searchInput =
  document.getElementById("i2c-search");

const resultsContainer =
  document.getElementById("i2c-results");

const resultsCount =
  document.getElementById("i2c-results-count");

const clearButton =
  document.getElementById("i2c-clear");

const exampleButtons =
  document.querySelectorAll(".i2c-example");

const deviceSelect =
  document.getElementById("i2c-device-select");

const addDeviceButton =
  document.getElementById("i2c-add-device");

const selectedContainer =
  document.getElementById("i2c-selected-devices");

const compatibilityResult =
  document.getElementById("i2c-compatibility-result");


let selectedDevices = [];


/* Escape HTML */

function escapeHTML(value) {

  return value
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#039;");

}


/* Address lookup */

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
          Try searching for <code>MPU6050</code>
          or <code>0x68</code>.
        </p>
      </div>
    `;

    return;
  }


  devices.forEach(device => {

    const addresses =
      device.addresses
        .map(address =>
          `<span class="i2c-address">
            ${escapeHTML(address)}
          </span>`
        )
        .join("");


    let links = "";


    if (device.links && device.links.length) {

      links = `
        <div class="i2c-links">

          ${device.links.map(link =>
            `<a href="${link.url}">
              ${escapeHTML(link.title)} →
            </a>`
          ).join("")}

        </div>
      `;

    }


    resultsContainer.innerHTML += `

      <article class="i2c-result">

        <h3>${escapeHTML(device.name)}</h3>

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


/* Search */

function searchDevices() {

  const query =
    searchInput.value.trim().toLowerCase();


  if (!query) {

    renderResults(i2cDevices);
    return;

  }


  const filtered =
    i2cDevices.filter(device => {

      const text = [

        device.name,
        device.category,
        device.manufacturer,
        device.description,
        ...device.addresses

      ]
        .join(" ")
        .toLowerCase();


      return text.includes(query);

    });


  renderResults(filtered);

}


searchInput.addEventListener(
  "input",
  searchDevices
);


clearButton.addEventListener(
  "click",
  function() {

    searchInput.value = "";

    searchInput.focus();

    renderResults(i2cDevices);

  }
);


exampleButtons.forEach(button => {

  button.addEventListener(
    "click",
    function() {

      searchInput.value =
        this.textContent.trim();

      searchDevices();

      searchInput.focus();

    }
  );

});


/* Populate device selector */

i2cDevices.forEach((device, index) => {

  const option =
    document.createElement("option");

  option.value = index;

  option.textContent = device.name;

  deviceSelect.appendChild(option);

});


/* Add device */

addDeviceButton.addEventListener(
  "click",
  function() {

    const index =
      parseInt(deviceSelect.value);

    if (isNaN(index)) {
      return;
    }


    const device =
      i2cDevices[index];


    if (
      selectedDevices.some(
        item => item.name === device.name
      )
    ) {

      return;

    }


    selectedDevices.push(device);

    deviceSelect.value = "";

    renderSelectedDevices();

    checkCompatibility();

  }
);


/* Render selected devices */

function renderSelectedDevices() {

  selectedContainer.innerHTML = "";


  selectedDevices.forEach(
    (device, index) => {

      const addresses =
        device.addresses.join(" / ");


      selectedContainer.innerHTML += `

        <div class="i2c-selected-device">

          <div class="i2c-selected-info">

            <strong>
              ${escapeHTML(device.name)}
            </strong>

            <span class="i2c-selected-address">
              ${escapeHTML(addresses)}
            </span>

          </div>

          <button
            type="button"
            class="i2c-remove"
            data-index="${index}"
          >
            Remove
          </button>

        </div>

      `;

    }
  );


  document
    .querySelectorAll(".i2c-remove")
    .forEach(button => {

      button.addEventListener(
        "click",
        function() {

          const index =
            parseInt(this.dataset.index);

          selectedDevices.splice(index, 1);

          renderSelectedDevices();

          checkCompatibility();

        }
      );

    });

}


/* Compatibility checker */

function checkCompatibility() {

  compatibilityResult.innerHTML = "";


  if (selectedDevices.length < 2) {

    return;

  }


  const addressMap = {};


  selectedDevices.forEach(device => {

    device.addresses.forEach(address => {

      if (!addressMap[address]) {

        addressMap[address] = [];

      }

      addressMap[address].push(device);

    });

  });


  const conflicts =
    Object.entries(addressMap)
      .filter(
        ([address, devices]) =>
          devices.length > 1
      );


  if (conflicts.length === 0) {

    compatibilityResult.innerHTML = `

      <div class="i2c-status i2c-status-ok">

        <h3>
          ✓ No I2C address conflicts detected
        </h3>

        <p>
          The selected devices do not share
          a common I2C address and can normally
          share the same I2C bus.
        </p>

        <p>
          Always check the individual module
          documentation for voltage levels,
          pull-up resistors and address configuration.
        </p>

      </div>

    `;

    return;

  }


  let conflictHTML = "";


  conflicts.forEach(
    ([address, devices]) => {

      conflictHTML += `

        <div class="i2c-conflict">

          <strong>
            Address conflict at ${escapeHTML(address)}
          </strong>

          <p>

            ${devices
              .map(device =>
                escapeHTML(device.name)
              )
              .join(" and ")}

            can use this address.

          </p>

        </div>

      `;

    }
  );


  compatibilityResult.innerHTML = `

    <div class="i2c-status i2c-status-conflict">

      <h3>
        ⚠ I2C address conflict detected
      </h3>

      <p>
        Two or more selected devices can use
        the same I2C address.
      </p>

      ${conflictHTML}

      <div class="i2c-solution">

        <strong>Possible solutions:</strong>

        <ul>

          <li>
            Change the address using an address
            pin or jumper if supported.
          </li>

          <li>
            Use a second I2C bus.
          </li>

          <li>
            Use an I2C multiplexer such as
            the TCA9548A.
          </li>

        </ul>

      </div>

    </div>

  `;

}


/* Initial results */

renderResults(i2cDevices);

</script>


---

## How to Use This Tool

First, use the search box to find an I2C device or address.

For example:

- `MPU6050`
- `0x68`
- `SSD1306`
- `BMA400`

The tool displays the known I2C addresses and basic information about the device.

To check several devices together, use the **I2C Compatibility Checker**.

Select a device and click **Add Device**.

Add all the I2C devices you plan to connect to the same bus.

The tool will check for addresses that are shared between the selected devices.

---

## Example: MPU6050 + BMA400 + SSD1306

A typical ESP32 project might contain:

| Device | I2C Address |
|---|---|
| BMA400 | `0x14` / `0x15` |
| MPU6050 | `0x68` / `0x69` |
| SSD1306 OLED | `0x3C` / `0x3D` |

These devices do not have a common I2C address, so they can normally share the same I2C bus.

However, address compatibility is only one part of a successful I2C design. Voltage levels, pull-up resistors, wiring and supported bus speed should also be checked.

---

## Example: MPU6050 + DS3231

Both the MPU6050 and DS3231 commonly use address `0x68`.

This creates a potential address conflict when both devices are connected to the same I2C bus.

Possible solutions include changing the MPU6050 address to `0x69`, if supported by the module, using another I2C bus, or using an I2C multiplexer.

---

## How to Find the Actual I2C Address

The easiest way to find which I2C devices are actually connected to your Arduino or ESP32 is to run an I2C scanner.

Our [I2C Scanner Tutorial](/i2c-scanner-tutorial/) includes a complete Arduino and ESP32 example.

---

## Important Note About I2C Compatibility

This tool checks **address conflicts only**.

A result showing no address conflict does not guarantee electrical compatibility.

Before connecting multiple devices, also verify:

- Supply voltage
- Logic voltage
- SDA/SCL pull-up resistors
- I2C bus speed
- Maximum bus capacitance
- Module-specific requirements

Always consult the manufacturer's datasheet when designing a final circuit.

---

## Related Embedded Nerd Tutorials

- [I2C Scanner Tutorial](/i2c-scanner-tutorial/)
- [MPU6050 Arduino Guide](/mpu6050-arduino-guide/)
- [MPU6050 Calibration Guide](/mpu6050-calibration-guide/)
- [BMA400 ESP32 Tutorial](/bma400-esp32-tutorial-wiring-code-arduino-guide/)
- [ESP32 OLED Tutorial](/esp32-oled-tutorial-wiring-code-display-guide/)
