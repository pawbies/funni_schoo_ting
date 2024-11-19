import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["searchInput", "authorList", "authorItem"];

  connect() {
    console.log("Author search controller connected");
  }

  filter() {
    const query = this.searchInputTarget.value.toLowerCase();
    this.authorItemTargets.forEach((item) => {
      const name = item.dataset.name.toLowerCase();
      if (name.includes(query) && query !== "") {
        item.classList.remove("hidden");
      } else {
        item.classList.add("hidden");
      }
    });
  }
}