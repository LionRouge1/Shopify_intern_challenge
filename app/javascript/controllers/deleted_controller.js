import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ['latest'];
    initialize () {
        this.latestTarget.innerHTML = '';
        this.deletedItems = JSON.parse(localStorage.getItem('deletedItems')) || [];
        this.deletedItems.forEach((item) => this.lastDeletedItems(item));
    }

    lastDeletedItems (item) {
        let template = `<div id="deleted_item_${item.deletedId}" class="row mb-2">
                            <div class="col-9 text-box">
                                <div class="row justify-content-between title">
                                    <span class="col">
                                        ${item.itemName}
                                    </span>
                                    <span class="col text-end">
                                        ${item.category}
                                    </span>
                                </div>
                                <p>
                                    ${item.description}
                                </p>
                            </div>
                            <div class="col-3 buttons">
                                <a data-remote="true" rel="nofollow" data-method="delete" href="${item.deleteLink}">
                                Undelete</a>
                                <a href="/deleted_items#deleted_item_${item.deletedId}">More..</a>
                            </div>
                        </div>
                        `;
        this.latestTarget.insertAdjacentHTML('beforeend', template);
    }

}