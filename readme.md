# FPS Optimalisatie Script voor FiveM

Dit project biedt een lichtgewicht FPS-optimalisatiescript voor FiveM-servers, waarmee spelers hun gameprestaties kunnen verbeteren met een eenvoudig commando.

## Functionaliteiten
- Vermindert grafische effecten en verbetert prestaties client-side.
- Verlaagt verkeers- en voetgangersdichtheid server-side.
- Eenvoudig te activeren via het commando `/meerfps`.
- Compatibel met elke FiveM-serverconfiguratie.

## Installatie

1. **Download of Clone de Repository:**
   - Download deze repository of kopieer de scripts naar je server resource-map.

2. **Voeg de Scripts toe aan een Nieuwe Resource Map:**
   - Maak een nieuwe map aan in je `resources` directory (bijvoorbeeld `jp-morefps`).
   - Plaats de volgende bestanden in de map:
     - `client.lua`
     - `server.lua`

3. **Maak een Manifestbestand:**
   - Voeg een `fxmanifest.lua` toe aan de map met de volgende inhoud:
     ```lua
     fx_version 'cerulean'
     game 'gta5'

     client_script 'client.lua'
     server_script 'server.lua'
     ```

4. **Werk de Serverconfiguratie bij:**
   - Voeg de resource toe aan je `server.cfg` bestand:
     ```
     ensure jp-morefps
     ```

5. **Herstart je Server:**
   - Start of herstart je FiveM-server om de resource in te schakelen.

## Gebruik

- Spelers kunnen `/meerfps` in de chat typen om de FPS-optimalisatie-instellingen te activeren.
- Het script past dynamisch instellingen aan om zowel client- als server-side prestaties te verbeteren.

## Hoe Werkt Het?

### Client-Side
- Schakelt onnodige grafische effecten en particle systemen uit.
- Vermindert lokaal verkeer- en voetgangersdichtheid.
- Zet schaduwen uit en verlaagt het Level of Detail (LOD).
- Verbergt HUD-componenten voor een schonere interface.

### Server-Side
- Beperkt voertuig- en voetgangersspawndichtheid op de hele server.
- Past deze optimalisaties globaal toe om de serverbelasting te verminderen.

## Compatibiliteit
- Getest op de nieuwste FiveM-versies.
- Werkt met alle bestaande scripts of serverconfiguraties.

## Bijdragen
Voel je vrij om bij te dragen aan het project door pull requests in te dienen of problemen te melden.

## Licentie
Dit script wordt uitgebracht onder de MIT-licentie. Je mag het vrij gebruiken, aanpassen en distribueren zoals gewenst.

