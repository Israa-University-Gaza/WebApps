$(document).ready(function () {
    function switchKey(value) {
        var persianChar = ["ذ", "ض", "ص", "ث", "ق", "ف", "غ", "ع", "ه", "خ", "ح", "ج", "د", "ش", "س", "ي", "ب", "ل", "ا", "ت", "ن", "م", "ک", "ط", "ئ", "ء", "ؤ", "ر", "لا", "ى", "ة", "و", "ز", "ظ"],
            englishChar = ["`", "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "[", "]", "a", "s", "d", "f", "g", "h", "j", "k", "l", ";", "'", "z", "x", "c", "v", "b", "n", "m", ",", ".", "?"];

        for (var i = 0, charsLen = persianChar.length; i < charsLen; i++) {
            value = value.replace(englishChar[i], persianChar[i]);
        }
        return value;
    }

    $('.arabic-input').keyup(function (event) {
        $(this).val(switchKey($(this).val()).toString());
        //event.preventDefault();
    });
});