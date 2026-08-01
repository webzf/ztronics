{% assign platforms_string = "" %}

{% for product in products %}

  {% if product.platforms %}

    {% for platform in product.platforms %}

      {% assign platforms_string = platforms_string | append: platform | append: "|" %}

    {% endfor %}

  {% endif %}

{% endfor %}

{% assign platforms = platforms_string | split: "|" | uniq | sort %}

<section class="en-filters-card">

    <div class="en-filter-header">

        <h2>Browse by Platform</h2>

        <button
            id="clearFilters"
            class="en-clear-filters"
            type="button">

            Clear Filters

        </button>

    </div>

    <div class="en-platforms">

        <button
            class="platform-chip active"
            type="button"
            data-platform="">

            All

        </button>

        {% for platform in platforms %}

            {% unless platform == "" %}

            <button
                class="platform-chip"
                type="button"
                data-platform="{{ platform }}">

                {{ platform }}

            </button>

            {% endunless %}

        {% endfor %}

    </div>

</section>
