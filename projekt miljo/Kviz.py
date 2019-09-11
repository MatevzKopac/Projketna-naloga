import json
import random

#Odpre datoteko z vprašanji
with open('vprasanja.json', encoding='utf-8') as json_file:
        data = json.load(json_file)

class Runda():
    vprasanje=""
    odgovori=[]
    pravilenOdgovor = ""
    odgovorjeno = ""
    zasluzek = 0

    #Sestavi novo vprašanje
    def randomVprasanje(self):
        izrebanoVprasanje = random.choice(list(data))
        self.vprasanje = data[izrebanoVprasanje]["vprasanje"]
        self.odgovori = data[izrebanoVprasanje]["odgovori"]
        self.pravilenOdgovor = data[izrebanoVprasanje]["pravilen"]
        self.odgovorjeno = ""
        self.zasluzek += 1
        data.pop(izrebanoVprasanje, None)


