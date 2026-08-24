---
title: "I2C Address Lookup & Compatibility Checker"
layout: single
permalink: /tools/i2c-address-lookup/
excerpt: "Free I2C address lookup and compatibility checker for Arduino, ESP32 and Raspberry Pi. Find I2C addresses, detect conflicts and build a compatible I2C device configuration."
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
  - Raspberry Pi
  - Electronics
---

# I2C Address Lookup & Compatibility Checker

Use this free I2C tool to find common I2C device addresses and check whether multiple devices can share the same I2C bus.

Search for a device such as `MPU6050`, search for an address such as `0x68`, or select several devices to check for I2C address conflicts.

<div class="i2c-tool">

<section class="i2c-panel">

<div class="i2c-panel-header">
<span class="i2c-kicker">I2C LOOKUP</span>
<h2>Find an I2C Device</h2>
<p>Search by device name, sensor type, manufacturer or hexadecimal I2C address.</p>
</div>

<div class="i2c-search-wrapper">
<input type="search" id="i2c-search" placeholder="Search device or address..." autocomplete="off" aria-label="Search I2C devices">
<button id="i2c-clear" type="button">Clear</button>
</div>

<div class="i2c-examples">
<span>Try:</span>
<button type="button" class="i2c-example">MPU6050</button>
<button type="button" class="i2c-example">0x68</button>
<button type="button" class="i2c-example">SSD1306</button>
<button type="button" class="i2c-example">BMA400</button>
</div>

<div id="i2c-results-count" aria-live="polite"></div>
<div id="i2c-results"></div>

</section>

<section class="i2c-panel compatibility-panel">

<div class="i2c-panel-header">
<span class="i2c-kicker">COMPATIBILITY CHECK</span>
<h2>Can These Devices Share an I2C Bus?</h2>
<p>Select the devices you want to connect and check for address conflicts.</p>
</div>

<div class="i2c-selector-row">
<select id="i2c-device-select" aria-label="Select an I2C device">
<option value="">Select a device...</option>
</select>
<button id="i2c-add-device" type="button">+ Add Device</button>
</div>

<div id="i2c-selected-devices"></div>
<div id="i2c-compatibility-result" aria-live="polite"></div>

</section>
</div>

<style>
.i2c-tool{max-width:920px;margin:2rem auto}
.i2c-panel{margin:0 0 2.5rem;padding:26px;border:1px solid rgba(255,255,255,.16);border-radius:12px;background:rgba(255,255,255,.018)}
.i2c-panel-header{margin-bottom:20px}
.i2c-kicker{display:block;margin-bottom:7px;font-size:.72rem;font-weight:700;letter-spacing:.12em;color:#5bc2be}
.i2c-panel-header h2{margin:0 0 8px}
.i2c-panel-header p{margin:0;opacity:.72}
.i2c-search-wrapper{display:flex;gap:10px;margin-top:22px}
#i2c-search{flex:1;min-width:0;padding:14px 16px;font:inherit;color:inherit;background:transparent;border:1px solid rgba(91,194,190,.52);border-radius:8px;outline:none;box-sizing:border-box}
#i2c-search:focus{border-color:#5bc2be;box-shadow:0 0 0 2px rgba(91,194,190,.12)}
#i2c-search::placeholder{opacity:.58}
#i2c-clear,#i2c-add-device{min-height:46px;padding:10px 17px;font:inherit;color:inherit;background:transparent;border:1px solid rgba(91,194,190,.52);border-radius:8px;cursor:pointer;transition:.2s ease}
#i2c-clear:hover,#i2c-add-device:hover{color:#5bc2be;border-color:#5bc2be;background:rgba(91,194,190,.08)}
.i2c-examples{display:flex;flex-wrap:wrap;align-items:center;gap:9px;margin:12px 0 20px;font-size:.9rem}
.i2c-examples>span{opacity:.62}
.i2c-example{padding:0;font:inherit;color:#5bc2be;background:none;border:0;cursor:pointer}
.i2c-example:hover{text-decoration:underline;color:#7bd6d2}
#i2c-results-count{margin:0 0 14px;font-size:.9rem;opacity:.62}
.i2c-result{padding:20px;margin-bottom:12px;border:1px solid rgba(255,255,255,.14);border-radius:9px}
.i2c-result h3{margin:0 0 10px}
.i2c-addresses{display:flex;flex-wrap:wrap;gap:7px;margin:0 0 15px}
.i2c-address{display:inline-block;padding:5px 9px;font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;font-size:.88rem;font-weight:700;color:#d9eeee;background:rgba(91,194,190,.09);border:1px solid rgba(91,194,190,.30);border-radius:5px}
.i2c-meta{margin:7px 0}
.i2c-meta strong{display:inline-block;min-width:105px}
.i2c-links{margin-top:16px;padding-top:13px;border-top:1px solid rgba(255,255,255,.10)}
.i2c-links a{display:inline-block;margin:0 18px 5px 0;color:#5bc2be}
.i2c-selector-row{display:flex;gap:10px;margin-top:22px}
#i2c-device-select{flex:1;min-width:0;min-height:46px;padding:10px 13px;font:inherit;color:inherit;background:transparent;border:1px solid rgba(91,194,190,.52);border-radius:8px}
#i2c-device-select option{color:#111;background:#fff}
.i2c-selected-device{display:flex;align-items:center;justify-content:space-between;gap:15px;padding:13px 15px;margin-top:9px;border:1px solid rgba(255,255,255,.13);border-radius:8px}
.i2c-selected-info strong{display:block;margin-bottom:4px}
.i2c-selected-address{font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;font-size:.82rem;opacity:.66}
.i2c-remove{flex:0 0 auto;padding:6px 10px;font:inherit;color:inherit;background:transparent;border:1px solid rgba(255,255,255,.22);border-radius:6px;cursor:pointer}
.i2c-remove:hover{border-color:#5bc2be;color:#5bc2be}
.i2c-status{margin-top:18px;padding:20px;border-radius:9px}
.i2c-status h3{margin:0 0 9px}
.i2c-status-ok{border:1px solid rgba(91,194,190,.42);background:rgba(91,194,190,.055)}
.i2c-status-warning{border:1px solid rgba(220,174,75,.48);background:rgba(220,174,75,.055)}
.i2c-status-conflict{border:1px solid rgba(220,90,90,.48);background:rgba(220,90,90,.055)}
.i2c-conflict{margin-top:14px;padding:15px;border-radius:7px}
.i2c-conflict-unresolved{border:1px solid rgba(220,90,90,.42);background:rgba(220,90,90,.045)}
.i2c-recommendation{margin-top:13px;padding:13px;border-left:3px solid #5bc2be;background:rgba(91,194,190,.055)}
.i2c-recommendation strong{color:#5bc2be}
.i2c-recommendation code{padding:2px 6px;border-radius:4px;background:rgba(91,194,190,.12)}
.i2c-config-table{width:100%;margin-top:17px;border-collapse:collapse}
.i2c-config-table th,.i2c-config-table td{padding:10px;text-align:left;border-bottom:1px solid rgba(255,255,255,.10)}
.i2c-config-table th{font-size:.84rem;opacity:.7}
.i2c-config-address{font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;font-weight:700;color:#5bc2be}
.i2c-no-results{padding:26px 18px;text-align:center;border:1px dashed rgba(255,255,255,.22);border-radius:9px}
@media(max-width:620px){.i2c-panel{padding:20px}.i2c-search-wrapper,.i2c-selector-row{flex-direction:column}#i2c-clear,#i2c-add-device{width:100%}.i2c-selected-device{align-items:flex-start}.i2c-meta strong{display:block;margin-bottom:2px}.i2c-config-table{font-size:.9rem}}
</style>

<script>
const i2cDevices = [
{name:"BMA400",addresses:["0x14","0x15"],category:"3-Axis Accelerometer",manufacturer:"Bosch Sensortec",description:"Ultra-low-power 3-axis accelerometer with motion detection, orientation detection, step counting and activity recognition.",links:[{title:"BMA400 Product Page",url:"/products/bma400/"},{title:"BMA400 ESP32 Tutorial",url:"/bma400-esp32-tutorial-wiring-code-arduino-guide/"}]},
{name:"MPU6050",addresses:["0x68","0x69"],category:"Accelerometer & Gyroscope",manufacturer:"TDK InvenSense",description:"6-axis motion sensor combining a 3-axis accelerometer and 3-axis gyroscope.",links:[{title:"MPU6050 Product Page",url:"/products/mpu6050/"},{title:"MPU6050 Arduino Guide",url:"/mpu6050-arduino-guide/"},{title:"MPU6050 Calibration Guide",url:"/mpu6050-calibration-guide/"}]},
{name:"BME280",addresses:["0x76","0x77"],category:"Environmental Sensor",manufacturer:"Bosch Sensortec",description:"Temperature, humidity and barometric pressure sensor."},
{name:"BMP280",addresses:["0x76","0x77"],category:"Pressure Sensor",manufacturer:"Bosch Sensortec",description:"Barometric pressure and temperature sensor."},
{name:"SSD1306 OLED",addresses:["0x3C","0x3D"],category:"OLED Display Controller",manufacturer:"Solomon Systech",description:"Popular monochrome OLED display controller used in many 128x64 and 128x32 I2C displays.",links:[{title:"SSD1306 Product Page",url:"/products/ssd1306-oled/"},{title:"ESP32 OLED Tutorial",url:"/esp32-oled-tutorial-wiring-code-display-guide/"}]},
{name:"SH1106 OLED",addresses:["0x3C","0x3D"],category:"OLED Display Controller",manufacturer:"Sino Wealth",description:"Monochrome OLED display controller commonly used in small I2C OLED modules."},
{name:"DS3231",addresses:["0x68"],category:"Real-Time Clock",manufacturer:"Analog Devices",description:"High-accuracy real-time clock."},
{name:"DS1307",addresses:["0x68"],category:"Real-Time Clock",manufacturer:"Maxim Integrated",description:"Low-power real-time clock with calendar functions."},
{name:"PCF8574",addresses:["0x20","0x21","0x22","0x23","0x24","0x25","0x26","0x27"],category:"I/O Expander",manufacturer:"NXP",description:"8-bit I2C GPIO expander commonly used with LCD backpacks."},
{name:"PCF8574A",addresses:["0x38","0x39","0x3A","0x3B","0x3C","0x3D","0x3E","0x3F"],category:"I/O Expander",manufacturer:"NXP",description:"Alternate-address version of the PCF8574 I2C GPIO expander."},
{name:"MCP23017",addresses:["0x20","0x21","0x22","0x23","0x24","0x25","0x26","0x27"],category:"16-Bit I/O Expander",manufacturer:"Microchip",description:"16-bit I2C GPIO expander with configurable ports."},
{name:"ADS1115",addresses:["0x48","0x49","0x4A","0x4B"],category:"Analog-to-Digital Converter",manufacturer:"Texas Instruments",description:"16-bit precision ADC with four input channels."},
{name:"ADS1015",addresses:["0x48","0x49","0x4A","0x4B"],category:"Analog-to-Digital Converter",manufacturer:"Texas Instruments",description:"12-bit ADC with four input channels."},
{name:"INA219",addresses:["0x40","0x41","0x44","0x45"],category:"Current / Power Monitor",manufacturer:"Texas Instruments",description:"Current, voltage and power monitoring sensor."},
{name:"PCA9685",addresses:["0x40","0x41","0x42","0x43","0x44","0x45","0x46","0x47","0x48","0x49","0x4A","0x4B","0x4C","0x4D","0x4E","0x4F"],category:"PWM / Servo Driver",manufacturer:"NXP",description:"16-channel PWM controller commonly used for servo and LED control."},
{name:"BH1750",addresses:["0x23","0x5C"],category:"Light Sensor",manufacturer:"ROHM",description:"Digital ambient light sensor."},
{name:"HMC5883L",addresses:["0x1E"],category:"3-Axis Magnetometer",manufacturer:"Honeywell",description:"Digital 3-axis magnetic field sensor."},
{name:"QMC5883L",addresses:["0x0D"],category:"3-Axis Magnetometer",manufacturer:"QST",description:"Digital 3-axis magnetic sensor commonly used as a compass module."},
{name:"VL53L0X",addresses:["0x29"],category:"Time-of-Flight Distance Sensor",manufacturer:"STMicroelectronics",description:"Time-of-flight distance sensor."},
{name:"SHT31",addresses:["0x44","0x45"],category:"Temperature & Humidity Sensor",manufacturer:"Sensirion",description:"Digital temperature and humidity sensor."},
{name:"CCS811",addresses:["0x5A","0x5B"],category:"Air Quality Sensor",manufacturer:"ScioSense",description:"Digital indoor air-quality sensor."},
{name:"AHT20",addresses:["0x38"],category:"Temperature & Humidity Sensor",manufacturer:"ASAIR",description:"Digital temperature and humidity sensor."},
{name:"TCA9548A",addresses:["0x70","0x71","0x72","0x73","0x74","0x75","0x76","0x77"],category:"I2C Multiplexer",manufacturer:"Texas Instruments",description:"8-channel I2C multiplexer for address conflicts and separate I2C channels."}
];

const searchInput=document.getElementById("i2c-search");
const resultsContainer=document.getElementById("i2c-results");
const resultsCount=document.getElementById("i2c-results-count");
const clearButton=document.getElementById("i2c-clear");
const exampleButtons=document.querySelectorAll(".i2c-example");
const deviceSelect=document.getElementById("i2c-device-select");
const addDeviceButton=document.getElementById("i2c-add-device");
const selectedContainer=document.getElementById("i2c-selected-devices");
const compatibilityResult=document.getElementById("i2c-compatibility-result");
let selectedDevices=[];

function escapeHTML(value){
return String(value).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;").replace(/'/g,"&#039;");
}

function renderResults(devices){
resultsContainer.innerHTML="";
resultsCount.textContent=devices.length+" device"+(devices.length===1?"":"s")+" found";
if(!devices.length){
resultsContainer.innerHTML='<div class="i2c-no-results"><strong>No matching devices found.</strong><p>Try a device name such as <code>MPU6050</code> or an address such as <code>0x68</code>.</p></div>';
return;
}
devices.forEach(device=>{
const addresses=device.addresses.map(address=>'<span class="i2c-address">'+escapeHTML(address)+'</span>').join("");
let links="";
if(device.links&&device.links.length){
links='<div class="i2c-links">'+device.links.map(link=>'<a href="'+link.url+'">'+escapeHTML(link.title)+' →</a>').join("")+'</div>';
}
resultsContainer.innerHTML+=
'<article class="i2c-result"><h3>'+escapeHTML(device.name)+'</h3><div class="i2c-addresses">'+addresses+'</div><p class="i2c-meta"><strong>Type:</strong>'+escapeHTML(device.category)+'</p><p class="i2c-meta"><strong>Manufacturer:</strong>'+escapeHTML(device.manufacturer)+'</p><p>'+escapeHTML(device.description)+'</p>'+links+'</article>';
});
}

function searchDevices(){
const query=searchInput.value.trim().toLowerCase();
if(!query){renderResults(i2cDevices);return;}
const filtered=i2cDevices.filter(device=>{
const text=[device.name,device.category,device.manufacturer,device.description,...device.addresses].join(" ").toLowerCase();
return text.includes(query);
});
renderResults(filtered);
}

searchInput.addEventListener("input",searchDevices);
clearButton.addEventListener("click",()=>{searchInput.value="";searchInput.focus();renderResults(i2cDevices);});
exampleButtons.forEach(button=>button.addEventListener("click",()=>{searchInput.value=button.textContent.trim();searchDevices();searchInput.focus();}));

i2cDevices.forEach((device,index)=>{
const option=document.createElement("option");
option.value=index;
option.textContent=device.name;
deviceSelect.appendChild(option);
});

addDeviceButton.addEventListener("click",()=>{
const index=parseInt(deviceSelect.value,10);
if(Number.isNaN(index))return;
const device=i2cDevices[index];
if(selectedDevices.some(item=>item.name===device.name)){deviceSelect.value="";return;}
selectedDevices.push(device);
deviceSelect.value="";
renderSelectedDevices();
checkCompatibility();
});

function renderSelectedDevices(){
selectedContainer.innerHTML="";
selectedDevices.forEach((device,index)=>{
selectedContainer.innerHTML+=
'<div class="i2c-selected-device"><div class="i2c-selected-info"><strong>'+escapeHTML(device.name)+'</strong><span class="i2c-selected-address">'+escapeHTML(device.addresses.join(" / "))+'</span></div><button type="button" class="i2c-remove" data-index="'+index+'">Remove</button></div>';
});
document.querySelectorAll(".i2c-remove").forEach(button=>{
button.addEventListener("click",()=>{
selectedDevices.splice(parseInt(button.dataset.index,10),1);
renderSelectedDevices();
checkCompatibility();
});
});
}

/* Finds a unique address assignment for all selected devices. */
function findAddressAssignment(devices){
const ordered=[...devices].sort((a,b)=>a.addresses.length-b.addresses.length);
const assignment={};
function solve(index,used){
if(index>=ordered.length)return true;
const device=ordered[index];
for(const address of device.addresses){
if(used.has(address))continue;
assignment[device.name]=address;
used.add(address);
if(solve(index+1,used))return true;
used.delete(address);
delete assignment[device.name];
}
return false;
}
return solve(0,new Set())?assignment:null;
}

function getConflicts(devices){
const map={};
devices.forEach(device=>{
device.addresses.forEach(address=>{
if(!map[address])map[address]=[];
map[address].push(device);
});
});
return Object.entries(map).filter(([,items])=>items.length>1);
}

function renderConfiguration(assignment){
return '<table class="i2c-config-table"><thead><tr><th>Device</th><th>Recommended Address</th></tr></thead><tbody>'+
selectedDevices.map(device=>'<tr><td>'+escapeHTML(device.name)+'</td><td class="i2c-config-address">'+escapeHTML(assignment[device.name])+'</td></tr>').join("")+
'</tbody></table>';
}

function checkCompatibility(){
compatibilityResult.innerHTML="";
if(selectedDevices.length<2)return;

const conflicts=getConflicts(selectedDevices);
const assignment=findAddressAssignment(selectedDevices);

if(!conflicts.length){
const config={};
selectedDevices.forEach(device=>config[device.name]=device.addresses[0]);
compatibilityResult.innerHTML=
'<div class="i2c-status i2c-status-ok"><h3>✓ No I2C address conflicts detected</h3><p>The selected devices have no common address in their listed address ranges and can normally share the same I2C bus.</p><strong>Configuration</strong>'+renderConfiguration(config)+'<p>This check covers I2C address conflicts only. Always verify voltage levels, pull-ups and bus speed for the actual modules you are using.</p></div>';
return;
}

if(assignment){
compatibilityResult.innerHTML=
'<div class="i2c-status i2c-status-warning"><h3>⚠ Address conflict detected — solution available</h3><p>Some selected devices can use the same address. However, their available address options allow a unique configuration.</p><div class="i2c-recommendation"><strong>✓ Recommended configuration</strong><p>Configure the devices so every device uses a unique address on the same I2C bus.</p>'+renderConfiguration(assignment)+'</div><p>Check the module documentation or board jumpers before changing an address. Not every breakout exposes all addresses listed by the underlying IC.</p></div>';
return;
}

let conflictHTML="";
conflicts.forEach(([address,items])=>{
conflictHTML+='<div class="i2c-conflict i2c-conflict-unresolved"><strong>Conflict at '+escapeHTML(address)+'</strong><p>'+items.map(device=>escapeHTML(device.name)).join(" and ")+' can use this address.</p></div>';
});

compatibilityResult.innerHTML=
'<div class="i2c-status i2c-status-conflict"><h3>⚠ I2C address conflict cannot be resolved automatically</h3><p>The selected devices do not have enough unique address options to share one I2C bus using the listed addresses.</p>'+conflictHTML+'<div class="i2c-recommendation"><strong>Possible solutions</strong><ul><li>Change an address using a solder jumper, address pin or configuration option if supported.</li><li>Use a second I2C bus if your microcontroller provides one.</li><li>Use an I2C multiplexer such as the TCA9548A.</li></ul></div></div>';
}

renderResults(i2cDevices);
</script>

---

## How to Use the I2C Address Lookup

Search by device name, sensor type, manufacturer or hexadecimal address.

Examples:

- `MPU6050`
- `0x68`
- `SSD1306`
- `BMA400`

The tool shows the known I2C addresses associated with the device.

For a real hardware check, use an I2C scanner to see which addresses actually respond on your bus.

See our [I2C Scanner Tutorial](/i2c-scanner-tutorial/) for a practical Arduino and ESP32 example.

## How to Check I2C Compatibility

Use the **I2C Compatibility Checker** to select all devices you want to connect to the same bus.

The checker compares the available addresses and attempts to find a configuration in which every selected device has a unique address.

For example:

| Device | Address |
|---|---|
| BMA400 | `0x14` |
| MPU6050 | `0x68` |
| SSD1306 OLED | `0x3C` |

No address conflict exists.

## Example: MPU6050 + DS3231

The MPU6050 and DS3231 commonly use `0x68`.

If both are configured at `0x68`, they cannot normally communicate independently on the same I2C bus.

If the MPU6050 module supports its alternative address, it can be configured at `0x69`, leaving:

| Device | Address |
|---|---|
| DS3231 | `0x68` |
| MPU6050 | `0x69` |

The exact address configuration depends on the breakout board.

## Important: Address Compatibility Is Not Electrical Compatibility

A successful result from this tool means that the selected devices have a possible **I2C address configuration** without an address collision.

It does not guarantee that the modules are electrically compatible.

Before building a circuit, also verify:

- Supply voltage
- Logic voltage
- SDA/SCL pull-up resistors
- I2C bus speed
- Bus capacitance
- Level shifting requirements
- Breakout-board-specific wiring

Always check the manufacturer's datasheet and the documentation for the exact breakout board you are using.

## What If Two Devices Have the Same Address?

If two devices have the same fixed address and cannot be configured differently, they cannot normally share the same I2C bus directly.

Possible solutions include:

- Changing one device's address
- Using another I2C bus
- Using an I2C multiplexer such as the TCA9548A
- Using a different module with a configurable address

## I2C Scanner

The address database tells you which addresses a device may use.

An I2C scanner tells you which addresses are actually responding on your hardware.

For Arduino and ESP32 projects, see our [I2C Scanner Tutorial](/i2c-scanner-tutorial/).

## Related Embedded Nerd Tutorials

- [I2C Scanner Tutorial](/i2c-scanner-tutorial/)
- [MPU6050 Arduino Guide](/mpu6050-arduino-guide/)
- [MPU6050 Calibration Guide](/mpu6050-calibration-guide/)
- [BMA400 ESP32 Tutorial](/bma400-esp32-tutorial-wiring-code-arduino-guide/)
- [ESP32 OLED Tutorial](/esp32-oled-tutorial-wiring-code-display-guide/)

## Disclaimer

I2C addresses can vary between IC variants, breakout boards and hardware configurations. This tool is intended as a practical reference and should not replace the manufacturer's datasheet or the documentation for your specific module.
