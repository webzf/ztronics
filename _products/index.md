---
title: "Electronic Components"
layout: single
permalink: /products/

author_profile: false
toc: false
classes: wide
search: false
---

<div class="en-products-toolbar">
 
<input
id="productSearch"
class="en-search"
type="text"
placeholder="Search components...">

<select id="platformFilter">

<option value="">All Platforms</option>

<option value="Arduino">Arduino</option>

<option value="ESP32">ESP32</option>

<option value="Raspberry Pi">Raspberry Pi</option>

<option value="STM32">STM32</option>

</select>

</div>

<div id="productsGrid" class="en-products-grid">

{% assign products = site.products | sort: "title" %}

{% for product in products %}

    {% include product-card.html
        product=product %}

{% endfor %}

</div>

<script>

const search=document.getElementById("productSearch");
const filter=document.getElementById("platformFilter");
const cards=document.querySelectorAll(".en-product-card");

function updateProducts(){

const text=search.value.toLowerCase();
const platform=filter.value.toLowerCase();

cards.forEach(card=>{

const title=card.dataset.title;
const description=card.dataset.description;
const manufacturer=card.dataset.manufacturer;
const platforms=card.dataset.platforms;

const matchesSearch=
title.includes(text)||
description.includes(text)||
manufacturer.includes(text);

const matchesPlatform=
platform==""||platforms.includes(platform);

card.style.display=
(matchesSearch&&matchesPlatform)?"":"none";

});

}

search.addEventListener("input",updateProducts);
filter.addEventListener("change",updateProducts);

</script>
