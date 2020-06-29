async function validateInput(url = '', data = {}) {
    let opts = {
        method: 'POST',
        headers: {
            'X-CSRF-Token':     document.getElementsByName('csrf-token')[0].getAttribute('content'),
            'Content-Type':     'application/json',
            'Accept':           'application/json',
        },
        credentials: 'same-origin',
        body: JSON.stringify(data)
    };
    const response = await fetch(url, opts)
    return response.json();
}

document.addEventListener('DOMContentLoaded', function (event) {
    if (document.getElementById('present-link-input')) {
        document.getElementById('present-submit-button').addEventListener('click', (event) => {
            validateInput('/validate_link', { 'link': document.getElementById('present-link-input').value } )
                .then(data => {
                        event.preventDefault();
                        console.log(data);
                    }
                )
        });
    }
});