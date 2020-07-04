async function validateInput(url = '') {
    let opts = {
        method: 'POST',
        headers: {
            'X-CSRF-Token':     document.getElementsByName('csrf-token')[0].getAttribute('content'),
            'Content-Type':     'application/json',
            'Accept':           'application/json',
        },
        credentials: 'same-origin',
    };
    const response = await fetch(url, opts)
    return response.json();
}

document.addEventListener('DOMContentLoaded', function (event) {
    if (document.getElementsByClassName('validate_this_field')) {
        const fieldsToValidate = document.getElementsByClassName('validate_this_field')
        Array.from(fieldsToValidate).forEach(field =>
            field.addEventListener('blur', (event) => {
                const fieldValue = field.value;
                const fieldName = field.name;
                const controllerName = document.getElementById('controller_name').value
                validateInput(`/${controllerName}/validate` + `?` + `${fieldName}` + `=` + `${fieldValue || ""}` )
                    .then(data => {
                        const helpText = document.getElementById(`${fieldName.split('[')[1].replace(']','')}_help_text`);
                            if (data.valid) {
                                helpText.style.display = 'none';
                                field.classList.remove('is-danger');
                                field.classList.add('is-success');
                                helpText.innerHTML = ''
                            } else {
                                event.preventDefault();
                                field.classList.add('is-danger');
                                helpText.style.removeProperty('display');
                                helpText.classList.add('help');
                                helpText.classList.add('is-danger');
                                const text = document.createTextNode(`${data.message[0]}`);
                                helpText.appendChild(text);
                            }
                        }
                    )
            })
        )}
});