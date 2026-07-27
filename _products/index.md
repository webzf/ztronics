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

<div
class="en-product-card"

data-title="{{ product.title | downcase }}"

data-platforms="{{ product.platforms | join: ',' | downcase }}">

<a href="{{ product.url | relative_url }}">

<img
src="{{ product.image }}"
alt="{{ product.title }}"
loading="lazy">

<h3>

{{ product.title }}

</h3>

</a>

<p>

{{ product.description }}

</p>

{% include buy-buttons.html product=product.product_id %}

</div>

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

const platforms=card.dataset.platforms;

const show=

title.includes(text)

&&

(platform=="" || platforms.includes(platform));

card.style.display=show?"":"none";

});

}

search.addEventListener("input",updateProducts);

filter.addEventListener("change",updateProducts);

</script>
