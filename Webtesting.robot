*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary

*** Test Cases ***
Yle
    [Documentation]    Menee Ylen sivuille ja avaa pääjutun.
    SeleniumLibrary.Open Browser    https://yle.fi/    chrome
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Click Link    Uutiset
    SeleniumLibrary.Click Link    xpath://*[@id="yle__contentAnchor"]/div/div[1]/div[1]/div/div/a
    SeleniumLibrary.Close Browser

Yle2
    [Documentation]    Menee Ylen sivuille ja tekee tekstihaku.
    SeleniumLibrary.Open Browser    https://yle.fi/    chrome
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Input Text    xpath://*[@id="app"]/div/div[1]/header/div/div/div[1]/form/input[3]    hallitus    clear=true
    SeleniumLibrary.Click Element    xpath://*[@id="app"]/div/div[1]/header/div/div/div[1]/form/button
    SeleniumLibrary.Close Browser

Digitraffic
    [Documentation]    Etsii "free-flow-speeds" osoitteen digitraficin sivuilta.
    SeleniumLibrary.Open Browser    https://www.digitraffic.fi/tieliikenne/    chrome
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Click Link    partial link:free-flow-speeds
    SeleniumLibrary.Close Browser

Digitraffic2
    [Documentation]    Varmistaa että digitraficin sivuilta löytyy teksti "Digitraffic".
    SeleniumLibrary.Open Browser    https://www.digitraffic.fi    chrome
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Page Should Contain    Digitraffic
    SeleniumLibrary.Close Browser

Digitraffic API
    RequestsLibrary.Create Session    Camera    https://tie.digitraffic.fi/api    verify=true
    RequestsLibrary.Get Request    Camera    /v1/data/camera-data
