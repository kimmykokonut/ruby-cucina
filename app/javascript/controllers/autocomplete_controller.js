import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["input"];

    search(event) {
        event.preventDefault();

        const query = event.target.value;

        if (query.length > 2) {
            fetch(`/ingredients/search?q=${encodeURIComponent(query)}`, {
                headers: { Accept: "text/vnd.turbo-stream.html" },
            })
                .then((response) => response.text())
                .then((html) => {
                    document.getElementById("ingredient_results").innerHTML = html;
                });
        }
    }
    select(event) {
    const ingredientId = event.target.dataset.id;
    const ingredientName = event.target.dataset.name;

    // Add the selected ingredient to the form or display it on the page
    console.log(`Selected Ingredient: ${ingredientName} (ID: ${ingredientId})`);
}
}