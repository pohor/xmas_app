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
const clearHelpText = (text, field) => {
  text.style.display = 'none';
  text.innerHTML = ''
  field.classList.remove('is-danger');
};

const disableButtons = (buttons) => {
    buttons.forEach(button =>
       button.disabled = true
    )
};

const enableButtons = (buttons) => {
    buttons.forEach(button =>
    button.disabled = false
    )
};

const checkForEmptyFields = (fields) => {
    return fields.some(element => element.value === (''))
};

const disableSubmitOnEmptyField = (fields, buttons) => {
    if ( checkForEmptyFields(fields)) {
        disableButtons(buttons)
    } else {
        enableButtons(buttons)
    }
};

document.addEventListener("turbolinks:load", function() {
    if (document.getElementsByClassName('validate_this_field')) {

        const fieldsToValidate = Array.from(document.getElementsByClassName('validate_this_field'))
        const buttons = Array.from(document.getElementsByClassName('button'));
        let timeout = null;

        disableSubmitOnEmptyField(fieldsToValidate, buttons);

        fieldsToValidate.forEach(field =>
            ['keyup', 'change', 'click'].forEach(function (e) {
                    field.addEventListener(e, function () {
                            clearTimeout(timeout);

                            const fieldValue = field.value;
                            const fieldName = field.name;
                            const controllerName = document.getElementById('controller_name').value
                            const helpText = document.getElementById(`${fieldName.split('[')[1].replace(']', '')}_help_text`);

                            clearHelpText(helpText, field);

                            timeout = setTimeout(function () {
                                validateInput(`/${controllerName}/validate` + `?` + `${fieldName}` + `=` + `${fieldValue || ""}`)
                                    .then(data => {
                                            if (data.valid) {
                                                field.classList.add('is-success');
                                                enableButtons(buttons);
                                                disableSubmitOnEmptyField(fieldsToValidate, buttons);
                                            } else {
                                                disableButtons(buttons);
                                                field.classList.add('is-danger');
                                                helpText.style.removeProperty('display');
                                                helpText.classList.add('help');
                                                helpText.classList.add('is-danger');
                                                const text = document.createTextNode(`${data.message[0]}`);
                                                helpText.appendChild(text);
                                            }
                                        }
                                    )
                            }, 250)
                        }
                    )
                }
            )
        )}
    })
