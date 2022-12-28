import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ['latest'];
    initialize () {
        this.deletedItems = JSON.parse(localStorage.getItem('deletedItems')) || [];
    }

    connect () {
        this.deletedItems.forEach((item) => this.lastDeletedItems(item));
    }

    lastDeletedItems (item) {
        let template = `<div id="deleted_item_${item.deletedId}" class="col-lg-3 p-3">
                            <div>
                                <p>
                                    <strong>Item name:</strong>
                                    ${item.item_name}
                                </p>
                                <p>
                                    <strong>Price:</strong>
                                    ${item.price}
                                </p>
                                <p>
                                    <strong>Category:</strong>
                                    ${item.category}
                                </p>
                                <p>
                                    <strong>Expire at:</strong>
                                    ${item.expire_at}
                                </p>
                                <p>
                                    <strong>Description</strong>
                                    ${item.description}
                                </p>
                            </div>
                            <a data-remote="true" rel="nofollow" data-method="delete" href="${item.deleteLink}">
                            Undelete</a>
                        </div>
                        `;
        this.latestTarget.insertAdjacentHTML('afterbegin', template);
    }


}