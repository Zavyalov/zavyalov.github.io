// vim:ts=4:sw=4:expandtab:
function up_init() {
    $('#submit').bind('click', function(event) { event.preventDefault(); up_show(); });
    up_show();
}

function create_input(name, idx, value) {
    return '<input type="text" id="' + name + '_' + idx + '" value="' + value + '"/>' + "\n";
}

function up_load() {
    up_init();
}

function up_show() {
    let text = 'begin<br>';

    const lim = $('#lim').val()
    const max = lim / 67 * 100

    text += `lim ${lim} and max ${max}<br><br>`

    for(let i=1; i <= 4; ++i) {
        const pr = $(`#pr${i}`).val()
        const r  = $(`#r${i}`).val()
        const t  = $(`#t${i}`).val()

        const prc = pr == 0 ? $('#prc').val() : 100 * (r - pr) / pr

        text += `${i} | pr ${pr} | r ${r} | t ${t} | prc ${prc} | steps `

        for(let s = 0; s <= 4; ++s) {
            const future = Math.round(100 * r / max + s * t)
            text += ` ... ${future}`;
        }

        text += '<br>'

    }

    $('#up').html(text);
}
