(function(){
"use strict";

var presets={
  "s3-psram":{family:"ESP32-S3",psram_min:"8"},
  "touch-spi":{display_present:"yes",touch:"yes",touch_interface:"SPI"},
  "native-usb":{native_usb:"yes"},
  "large-display":{display_present:"yes",size_min:"4"},
  "c6-amoled-touch-battery":{family:"ESP32-C6",display_present:"yes",display_technology:"AMOLED",resolution:"368x448",touch:"yes",touch_type:"capacitive",touch_interface:"I2C",display_interface:"QSPI",battery:"yes",battery_charging:"yes"}
};

function applyPreset(id){
  var values=presets[id];
  if(!values)return;

  Object.keys(values).forEach(function(key){
    var field=document.getElementById(key);
    if(field){
      field.value=values[key];
      field.dispatchEvent(new Event("change",{bubbles:true}));
    }

    var required=document.getElementById(key+"-required");
    if(required)required.checked=true;
  });

  var select=document.getElementById("preset-select");
  if(select)select.value=id;

  var advanced=document.getElementById("advanced-filters");
  if(advanced && id!=="native-usb")advanced.open=true;

  var form=document.getElementById("selector-form");
  if(form && typeof form.requestSubmit==="function"){
    form.requestSubmit();
  }else if(form){
    var event=new Event("submit",{bubbles:true,cancelable:true});
    form.dispatchEvent(event);
  }
}

function init(){
  var button=document.getElementById("apply-preset-btn");
  var select=document.getElementById("preset-select");
  if(!button||!select)return;

  button.addEventListener("click",function(event){
    event.preventDefault();
    applyPreset(select.value);
  });
}

if(document.readyState==="loading"){
  document.addEventListener("DOMContentLoaded",init);
}else{
  init();
}

window.EmbeddedNerdApplyPresetDirect=applyPreset;
})();