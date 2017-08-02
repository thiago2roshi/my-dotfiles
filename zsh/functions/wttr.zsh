# wttr weather report in CLI
clima()
{
    # change Paris to your default location
    curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Sao_Paulo}"
}
