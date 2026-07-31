---
title: "Electronic Components"
layout: single
permalink: /products/

author_profile: false
toc: false
classes: wide
search: false
---

<section class="en-products-hero">

    <h1>Electronic Components</h1>

    <p>
        Browse development boards, displays, sensors and modules
        used throughout Embedded Nerd tutorials.
    </p>

    <div class="en-products-search">

        <input
            id="productSearch"
            class="en-search"
            type="search"
            placeholder="Search components..."
            autocomplete="off">

    </div>

</section>

<section class="en-platforms">

    <button class="platform-chip active" data-platform="">
        All
    </button>

    <button class="platform-chip" data-platform="ESP32">
        ESP32
    </button>

    <button class="platform-chip" data-platform="Arduino">
        Arduino
    </button>

    <button class="platform-chip" data-platform="STM32">
        STM32
    </button>

    <button class="platform-chip" data-platform="Raspberry Pi">
        Raspberry Pi
    </button>

</section>

<div class="en-products-info">

    <span id="productsCount"></span>

</div>

<div id="productsGrid" class="en-products-grid">

{% assign products = site.products | sort:"title" %}

{% for product in products %}

    {% include product-card.html product=product %}

{% endfor %}

</div>

<div
    id="noProducts"
    class="en-no-products"
    hidden>

    No components found.

</div>

<script>

document.addEventListener("DOMContentLoaded",()=>{

const search=document.getElementById("productSearch");

const chips=document.querySelectorAll(".platform-chip");

const cards=[...document.querySelectorAll(".en-product-card")];

const counter=document.getElementById("productsCount");

const empty=document.getElementById("noProducts");

let platform="";

function normalize(value){

return(value||"")
.toLowerCase()
.normalize("NFD")
.replace(/[\u0300-\u036f]/g,"");

}

function filterProducts(){

const text=normalize(search.value);

let visible=0;

cards.forEach(card=>{

const title=normalize(card.dataset.title);

const description=normalize(card.dataset.description);

const manufacturer=normalize(card.dataset.manufacturer);

const platforms=normalize(card.dataset.platforms);

const show=

(
title.includes(text)||
description.includes(text)||
manufacturer.includes(text)||
platforms.includes(text)
)

&&

(
platform===""||
platforms.includes(platform)
);

card.hidden=!show;

if(show) visible++;

});

counter.textContent=`Showing ${visible} component${visible!=1?"s":""}`;

empty.hidden=visible!==0;

}

search.addEventListener("input",filterProducts);

chips.forEach(chip=>{

chip.addEventListener("click",()=>{

chips.forEach(c=>c.classList.remove("active"));

chip.classList.add("active");

platform=normalize(chip.dataset.platform);

filterProducts();

});

});

filterProducts();

});

</script>
