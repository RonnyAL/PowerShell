function Tiny-Text {
    param(
        [ValidateSet('Smallcaps', 'Superscript', 'Subscript')]
        [string] $Type = 'Smallcaps',
        [Parameter(Mandatory, Position = 1, ValueFromPipeline)]
        [string] $Intext
    )
    
    $inArr = $Intext.ToCharArray()
    $in = 'abcdefghijklmnopqrstuvwxyzæøåABCDEFGHIJKLMNOPQRSTUVWXYZÆØÅ0123456789,._-!#¤%&/()=?`\;:'.ToCharArray()

    if ($Type -eq 'Smallcaps') {
        $out = 'ᴀʙᴄᴅᴇғɢʜɪᴊᴋʟᴍɴᴏᴘǫʀsᴛᴜᴠᴡxʏᴢæøåABCDEFGHIJKLMNOPQRSTUVWXYZÆØÅ0123456789,._-!#¤%&/()=?`;:'.ToCharArray()
    }
    elseif ($Type -eq 'Superscript') {
        $out = 'ᵃᵇᶜᵈᵉᶠᵍʰᶦʲᵏˡᵐⁿᵒᵖᵠʳˢᵗᵘᵛʷˣʸᶻæøåᴬᴮᶜᴰᴱᶠᴳᴴᴵᴶᴷᴸᴹᴺᴼᴾᵠᴿˢᵀᵁⱽᵂˣʸᶻÆØÅ⁰¹²³⁴⁵⁶⁷⁸⁹,._⁻ᵎ#¤%&/⁽⁾⁼ˀ`;:'.ToCharArray()
    }
    else {
        $out = 'ₐᵦ𝒸𝒹ₑ𝒻𝓰ₕᵢⱼₖₗₘₙₒₚᵩᵣₛₜᵤᵥ𝓌ₓᵧ𝓏æøåₐBCDₑFGₕᵢⱼₖₗₘₙₒₚQᵣₛₜᵤᵥWₓYZÆØÅ₀₁₂₃₄₅₆₇₈₉,._₋!"#¤%&/₍₎₌?`;:'.ToCharArray()
    }
    return (
        $inArr | % {
            if ($in.Contains($_)) {
                $out[$in.IndexOf($_)]
            }
            else { $_ }
        }) -join ''
}

# (Optional) Enable alias "tt"
# Set-Alias -Name 'tt' -Value Tiny-Text