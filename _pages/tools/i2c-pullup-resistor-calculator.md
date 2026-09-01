---
title: "I2C Pull-up Resistor Calculator"
tool: true
layout: single
permalink: /tools/i2c-pullup-resistor-calculator/

sidebar:
  nav: "embedded"

excerpt: "Free I2C pull-up resistor calculator for Arduino, ESP32 and Raspberry Pi. Calculate the valid minimum and maximum pull-up resistor range from bus voltage, speed, sink current and bus capacitance."

show_date: false
read_time: false
last_modified_at: false
toc: true
toc_label: "Contents"
toc_sticky: true
---

## I2C Pull-up Resistor Calculator

<div class="en-i2c-calculator">

  <div class="en-i2c-grid">

    <div class="en-i2c-inputs">

      <div class="en-i2c-field">
        <label for="i2c-vdd">Bus voltage (V)</label>
        <input id="i2c-vdd" type="number" min="0.1" max="20" step="0.1" value="3.3" inputmode="decimal">
        <small>Typical values: 3.3 V or 5 V.</small>
      </div>

      <div class="en-i2c-field">
        <label for="i2c-mode">I2C speed mode</label>
        <select id="i2c-mode">
          <option value="standard">Standard-mode — 100 kHz</option>
          <option value="fast" selected>Fast-mode — 400 kHz</option>
          <option value="fastplus">Fast-mode Plus — 1 MHz</option>
        </select>
        <small>The mode sets the maximum specified rise time and the default sink-current requirement.</small>
      </div>

      <div class="en-i2c-field">
        <label for="i2c-cap">Bus capacitance (pF)</label>
        <input id="i2c-cap" type="number" min="1" max="5000" step="1" value="100" inputmode="decimal">
        <small>Include device pins, PCB traces, connectors and other bus capacitance.</small>
      </div>

      <div class="en-i2c-field">
        <label for="i2c-vol">VOL(max) (V)</label>
        <input id="i2c-vol" type="number" min="0" max="5" step="0.01" value="0.40" inputmode="decimal">
        <small>Maximum LOW-level voltage used for the minimum-resistance calculation.</small>
      </div>

      <div class="en-i2c-field">
        <label for="i2c-iol">Sink current IOL (mA)</label>
        <input id="i2c-iol" type="number" min="0.1" max="100" step="0.1" value="3.0" inputmode="decimal">
        <small id="i2c-iol-note">Default: 3 mA for Standard-mode and Fast-mode.</small>
      </div>

      <div class="en-i2c-field">
        <label for="i2c-tr">Maximum rise time (ns)</label>
        <input id="i2c-tr" type="number" min="1" max="10000" step="1" value="300" inputmode="decimal">
        <small>Use the actual limit required by your devices if it differs from the selected mode.</small>
      </div>

    </div>

    <div class="en-i2c-results" aria-live="polite">

      <div id="i2c-status" class="en-i2c-status">Calculating…</div>

      <div class="en-i2c-result-grid">
        <div class="en-i2c-result-card">
          <span>Rp(min)</span>
          <strong id="i2c-rmin">—</strong>
          <small>Sink-current limit</small>
        </div>

        <div class="en-i2c-result-card">
          <span>Rp(max)</span>
          <strong id="i2c-rmax">—</strong>
          <small>Rise-time limit</small>
        </div>

        <div class="en-i2c-result-card en-i2c-highlight">
          <span>Recommended</span>
          <strong id="i2c-recommended">—</strong>
          <small>Nearest standard value inside the range</small>
        </div>

        <div class="en-i2c-result-card">
          <span>Pull-up current</span>
          <strong id="i2c-current">—</strong>
          <small>Approx. current when LOW</small>
        </div>
      </div>

      <div class="en-i2c-details">
        <div><span>Selected resistor</span><strong id="i2c-selected">—</strong></div>
        <div><span>Estimated rise time</span><strong id="i2c-rise">—</strong></div>
        <div><span>RC time constant</span><strong id="i2c-tau">—</strong></div>
        <div><span>Valid resistor values</span><strong id="i2c-range">—</strong></div>
      </div>

      <p id="i2c-message" class="en-i2c-message"></p>
    </div>

  </div>

  <div class="en-i2c-note">
    <strong>Important:</strong> The capacitance value is an estimate unless you have measured the bus.
    The calculator gives a design range; always verify the actual SDA/SCL waveforms and rise time on the finished hardware.
  </div>

</div>

<style>
.en-i2c-calculator { margin: 1.5rem 0 2rem; }
.en-i2c-grid { display:grid; grid-template-columns:minmax(0,1fr) minmax(0,1fr); gap:1.5rem; }
.en-i2c-inputs,.en-i2c-results { border:1px solid rgba(127,127,127,.25); border-radius:8px; padding:1.25rem; }
.en-i2c-field { margin-bottom:1rem; }
.en-i2c-field:last-child { margin-bottom:0; }
.en-i2c-field label { display:block; font-weight:700; margin-bottom:.35rem; }
.en-i2c-field input,.en-i2c-field select { width:100%; box-sizing:border-box; padding:.65rem .7rem; border:1px solid rgba(127,127,127,.45); border-radius:5px; background:inherit; color:inherit; font:inherit; }
.en-i2c-field small,.en-i2c-result-card small { display:block; margin-top:.3rem; opacity:.72; line-height:1.4; }
.en-i2c-status { padding:.7rem .85rem; border-radius:6px; font-weight:700; margin-bottom:1rem; background:rgba(127,127,127,.12); }
.en-i2c-status.valid { border-left:4px solid #2e7d32; }
.en-i2c-status.invalid { border-left:4px solid #c62828; }
.en-i2c-result-grid { display:grid; grid-template-columns:repeat(2,minmax(0,1fr)); gap:.75rem; }
.en-i2c-result-card { padding:.9rem; border:1px solid rgba(127,127,127,.2); border-radius:6px; }
.en-i2c-result-card span { display:block; font-size:.88rem; opacity:.75; }
.en-i2c-result-card strong { display:block; font-size:1.25rem; margin-top:.2rem; }
.en-i2c-highlight { border-width:2px; }
.en-i2c-details { margin-top:1rem; border-top:1px solid rgba(127,127,127,.2); }
.en-i2c-details > div { display:flex; justify-content:space-between; gap:1rem; padding:.65rem 0; border-bottom:1px solid rgba(127,127,127,.12); }
.en-i2c-details span { opacity:.75; }
.en-i2c-message { margin:1rem 0 0; line-height:1.55; }
.en-i2c-note { margin-top:1rem; padding:1rem; border-left:4px solid rgba(127,127,127,.5); background:rgba(127,127,127,.08); }
@media (max-width:800px) { .en-i2c-grid { grid-template-columns:1fr; } }
@media (max-width:480px) {
  .en-i2c-result-grid { grid-template-columns:1fr; }
  .en-i2c-details > div { flex-direction:column; gap:.15rem; }
}
</style>

<script>
(function () {
  "use strict";

  const ids = ["i2c-vdd","i2c-mode","i2c-cap","i2c-vol","i2c-iol","i2c-tr"];
  const el = {};
  ids.forEach(id => el[id] = document.getElementById(id));

  const status = document.getElementById("i2c-status");
  const rminOut = document.getElementById("i2c-rmin");
  const rmaxOut = document.getElementById("i2c-rmax");
  const recOut = document.getElementById("i2c-recommended");
  const currentOut = document.getElementById("i2c-current");
  const selectedOut = document.getElementById("i2c-selected");
  const riseOut = document.getElementById("i2c-rise");
  const tauOut = document.getElementById("i2c-tau");
  const rangeOut = document.getElementById("i2c-range");
  const messageOut = document.getElementById("i2c-message");
  const iolNote = document.getElementById("i2c-iol-note");

  const modeDefaults = {
    standard: { rise:1000, iol:3 },
    fast: { rise:300, iol:3 },
    fastplus: { rise:120, iol:20 }
  };

  const e12Base = [1,1.2,1.5,1.8,2.2,2.7,3.3,3.9,4.7,5.6,6.8,8.2];
  const standardValues = [];
  for (let decade=-1; decade<=7; decade++) {
    const m = Math.pow(10,decade);
    e12Base.forEach(v => standardValues.push(v*m));
  }

  function nearestStandardInside(min,max) {
    const candidates = standardValues.filter(v => v >= min && v <= max);
    if (!candidates.length) return null;
    const target = Math.sqrt(min*max);
    candidates.sort((a,b) => Math.abs(Math.log(a/target))-Math.abs(Math.log(b/target)));
    return candidates[0];
  }

  function formatResistance(r) {
    if (!Number.isFinite(r)) return "—";
    if (r >= 1e6) return (r/1e6).toFixed(2).replace(/\.00$/,"") + " MΩ";
    if (r >= 1000) {
      const v = r/1000;
      return v.toFixed(v >= 100 ? 0 : v >= 10 ? 1 : 2).replace(/\.0$/,"") + " kΩ";
    }
    return Math.round(r) + " Ω";
  }

  function formatCurrent(a) {
    if (!Number.isFinite(a)) return "—";
    const mA = a*1000;
    return mA >= 1
      ? mA.toFixed(mA >= 10 ? 1 : 2).replace(/\.00$/,"") + " mA"
      : (a*1e6).toFixed(0) + " µA";
  }

  function formatTimeNs(ns) {
    if (!Number.isFinite(ns)) return "—";
    if (ns >= 1e6) return (ns/1e6).toFixed(2) + " ms";
    if (ns >= 1000) return (ns/1000).toFixed(2) + " µs";
    return ns.toFixed(1) + " ns";
  }

  function setStatus(valid,text) {
    status.classList.remove("valid","invalid");
    status.classList.add(valid ? "valid" : "invalid");
    status.textContent = text;
  }

  function updateMode() {
    const mode = modeDefaults[el["i2c-mode"].value];
    if (!mode) return;
    el["i2c-tr"].value = mode.rise;
    el["i2c-iol"].value = mode.iol;
    iolNote.textContent = mode.iol === 20
      ? "Default: 20 mA for Fast-mode Plus."
      : "Default: 3 mA for Standard-mode and Fast-mode.";
    calculate();
  }

  function calculate() {
    const vdd = Number(el["i2c-vdd"].value);
    const capPf = Number(el["i2c-cap"].value);
    const vol = Number(el["i2c-vol"].value);
    const iolMa = Number(el["i2c-iol"].value);
    const trNs = Number(el["i2c-tr"].value);

    const ok = Number.isFinite(vdd) && Number.isFinite(capPf) &&
      Number.isFinite(vol) && Number.isFinite(iolMa) && Number.isFinite(trNs) &&
      vdd > 0 && capPf > 0 && vol >= 0 && vol < vdd && iolMa > 0 && trNs > 0;

    if (!ok) {
      setStatus(false,"Enter valid values");
      [rminOut,rmaxOut,recOut,currentOut,selectedOut,riseOut,tauOut,rangeOut]
        .forEach(n => n.textContent="—");
      messageOut.textContent="Check the input values. VOL(max) must be lower than the bus voltage.";
      return;
    }

    const iolA = iolMa/1000;
    const capF = capPf*1e-12;
    const trS = trNs*1e-9;

    const rMin = (vdd-vol)/iolA;
    const rMax = trS/(0.8473*capF);

    rminOut.textContent = formatResistance(rMin);
    rmaxOut.textContent = formatResistance(rMax);
    rangeOut.textContent = formatResistance(rMin) + " – " + formatResistance(rMax);

    if (rMin > rMax) {
      setStatus(false,"No valid resistor range");
      [recOut,currentOut,selectedOut,riseOut,tauOut].forEach(n => n.textContent="—");
      messageOut.textContent =
        "Rp(min) is higher than Rp(max). Reduce bus capacitance, lower the I2C speed, or review the electrical limits of the devices.";
      return;
    }

    const recommended = nearestStandardInside(rMin,rMax);

    if (recommended === null) {
      setStatus(true,"Range is valid, but no E12 value fits");
      recOut.textContent="No E12 value";
      selectedOut.textContent="Choose a precision value";
      currentOut.textContent="—";
      riseOut.textContent="—";
      tauOut.textContent="—";
      messageOut.textContent="No E12 resistor falls inside the calculated range. Consider another standard resistor series.";
      return;
    }

    const current = (vdd-vol)/recommended;
    const tauNs = recommended*capF*1e9;
    const riseNs = 0.8473*recommended*capF*1e9;

    setStatus(true,"Valid resistor range");
    recOut.textContent=formatResistance(recommended);
    selectedOut.textContent=formatResistance(recommended);
    currentOut.textContent=formatCurrent(current);
    riseOut.textContent=formatTimeNs(riseNs);
    tauOut.textContent=formatTimeNs(tauNs);
    messageOut.textContent =
      "The selected E12 value is inside the calculated range. Verify SDA and SCL rise time on the finished hardware.";
  }

  el["i2c-mode"].addEventListener("change",updateMode);
  ids.forEach(id => {
    if (id !== "i2c-mode") {
      el[id].addEventListener("input",calculate);
      el[id].addEventListener("change",calculate);
    }
  });

  calculate();
})();
</script>

## How the I2C pull-up resistor is calculated

The calculator determines a **minimum** and **maximum** resistor value.

The valid resistor must satisfy:

**Rp(min) ≤ Rp ≤ Rp(max)**

The lower limit is determined by the current that an I2C device must
sink while pulling SDA or SCL LOW:

**Rp(min) = (VDD − VOL(max)) / IOL**

The upper limit is determined by the bus capacitance and the maximum
allowed rise time:

**Rp(max) = tr / (0.8473 × Cb)**

These are the equations specified by NXP in section 7.1 of the UM10204
I2C-bus specification. The 0.8473 factor comes from the 30%--70% RC
rise-time definition used for I2C. [NXP
UM10204](https://www.nxp.com/docs/en/user-guide/UM10204.pdf)

### What Rp(min) means

A pull-up resistor that is **too small** produces more current when a
device pulls the bus LOW.

For example, with a 3.3 V bus, VOL(max) = 0.4 V and IOL = 3 mA:

**Rp(min) ≈ (3.3 − 0.4) / 0.003 ≈ 967 Ω**

Using a resistor below this value can exceed the assumed sink-current
limit.

### What Rp(max) means

A resistor that is **too large** makes the rising edge too slow.

I2C devices use open-drain/open-collector outputs, so the bus is
actively pulled LOW but relies on the pull-up resistor and bus
capacitance to return HIGH.

Higher capacitance or a faster I2C mode therefore requires a lower
maximum resistor value.

## I2C rise-time limits

The commonly used maximum rise times for the modes supported by this
calculator are:

  I2C mode           Typical clock   Maximum rise time
  ---------------- --------------- -------------------
  Standard-mode            100 kHz             1000 ns
  Fast-mode                400 kHz              300 ns
  Fast-mode Plus             1 MHz              120 ns

Always check the datasheets for the devices actually used in your
design.

Fast-mode Plus is particularly important because its sink-current
requirement is higher. The calculator therefore uses **20 mA** as the
default IOL value for Fast-mode Plus, while Standard-mode and Fast-mode
use **3 mA**. These values follow the pull-up sizing guidance in
UM10204. [NXP
UM10204](https://www.nxp.com/docs/en/user-guide/UM10204.pdf)

## How much bus capacitance should you enter?

The bus capacitance is **not simply the capacitance of one sensor**.

It includes the combined capacitance of:

-   MCU SDA/SCL pins
-   sensor and peripheral pins
-   PCB traces
-   connectors
-   level shifters
-   protection components
-   cables and wiring

NXP describes bus capacitance as the total capacitance of the wires,
connections and device pins.

If the capacitance is unknown, use a reasonable estimate and treat the
result as a starting point. For a final hardware design, measuring the
actual rise time with an oscilloscope is preferable.

## Why common 4.7 kΩ pull-ups are not always correct

**4.7 kΩ** is a common I2C pull-up value, but it is not universally
correct.

It can work well on a short, low-capacitance 3.3 V bus, but the correct
value depends on:

-   bus voltage
-   I2C speed
-   total bus capacitance
-   device sink-current capability
-   required rise time

For example, a higher-capacitance Fast-mode bus may require a lower
resistor than 4.7 kΩ, while a small Standard-mode bus may work perfectly
with a larger value.

The correct approach is to calculate the allowable range instead of
blindly choosing a standard value.

## Multiple I2C devices and pull-ups

One common source of I2C problems is having **multiple breakout boards
with their own pull-up resistors**.

Pull-ups connected in parallel produce a lower effective resistance:

**1 / Req = 1 / R1 + 1 / R2 + 1 / R3 + ...**

For example, two 4.7 kΩ pull-ups in parallel produce an effective
resistance of about **2.35 kΩ**.

This can be beneficial for rise time, but it also increases the
LOW-level current that the active device must sink.

If an I2C bus becomes unreliable after adding another sensor module,
check whether the new module also contains SDA/SCL pull-up resistors.

## Practical I2C pull-up resistor workflow

A good design workflow is:

1.  Determine the **I2C bus voltage**.
2.  Select the required **I2C speed**.
3.  Estimate the total **bus capacitance**.
4.  Check the weakest device's **VOL(max)** and **IOL** specifications.
5.  Calculate **Rp(min)**.
6.  Calculate **Rp(max)**.
7.  Choose a standard resistor value inside the valid range.
8.  Check for pull-ups already present on connected modules.
9.  Verify SDA and SCL rise times on the finished hardware.

For debugging I2C devices and addresses, you can also use the [I2C
Address Lookup](/tools/i2c-address-lookup/) tool on Embedded Nerd.

## FAQ

### What is the best I2C pull-up resistor value?

There is no single value that is best for every I2C bus. A value such as
4.7 kΩ is common, but the correct value depends on bus voltage,
capacitance, speed and device sink-current capability.

Use the calculator to determine the valid range for your bus.

### Can I use 10 kΩ pull-ups for I2C?

Sometimes. 10 kΩ can work on a low-capacitance Standard-mode bus, but it
may produce rise times that are too slow for Fast-mode or
higher-capacitance buses.

### Can I use 1 kΩ pull-ups?

A 1 kΩ resistor can provide fast rise times, but it can also create
excessive LOW-level current. Check Rp(min) and the IOL rating of every
device that can pull the bus LOW before using a low resistance.

### Do SDA and SCL need separate pull-up resistors?

Yes. Normally SDA and SCL each have their own pull-up resistor connected
to the I2C bus supply.

### Do I need pull-ups with an ESP32?

Usually, yes, unless the board or connected device already provides
suitable pull-ups. Avoid adding another set of pull-ups without checking
the total effective resistance of the bus.

### Do I need pull-ups with an Arduino?

It depends on the Arduino board and connected hardware. Some boards or
modules may already include pull-ups. Check the schematic and datasheets
before adding external resistors.

### What happens if the I2C pull-up resistor is too large?

The bus rises too slowly. At higher speeds this can violate the I2C
rise-time specification and cause communication errors.

### What happens if the I2C pull-up resistor is too small?

The bus can rise quickly, but the device pulling the line LOW must sink
more current. If the current exceeds its specification, VOL may become
too high or the device may be overstressed.

## Technical reference

The calculations in this tool are based on the pull-up resistor sizing
guidance in:

-   NXP Semiconductors, **UM10204 I²C-bus specification and user
    manual**, Rev. 7.0, section 7.1.
-   Rp(max): rise-time and bus-capacitance constraint.
-   Rp(min): supply voltage, VOL(max) and sink-current constraint.

For the authoritative specification, see the [NXP UM10204 I²C-bus
specification and user
manual](https://www.nxp.com/docs/en/user-guide/UM10204.pdf).

> **Engineering note:** This calculator is a design aid, not a
> substitute for checking the electrical specifications of the actual
> devices in your design. For production hardware, verify SDA/SCL rise
> and fall times, LOW-level voltage and current on the completed bus.
