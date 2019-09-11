import bottle
import Kviz

runda = Kviz.Runda()

@bottle.get('/')
def igra():
    runda.randomVprasanje()
    runda.zasluzek = 1
    return bottle.template('zacetnaStran.tpl')

@bottle.get('/igra')
def zacetekRunde():
    if (runda.odgovorjeno != ""):
        runda.randomVprasanje()
    runda.odgovorjeno = ""

    if (runda.zasluzek == 11):
        return bottle.redirect('/konec')

    try :
        runda.odgovorjeno = (bottle.request.query['odg'].upper())
        return bottle.template('igra.tpl', vprasanje = runda.vprasanje, odgovori=runda.odgovori, pravilen=runda.pravilenOdgovor, odgovorjeno = runda.odgovorjeno, zasluzek = runda.zasluzek)
    except:
        return bottle.template('igra.tpl', vprasanje = runda.vprasanje, odgovori=runda.odgovori, pravilen=runda.pravilenOdgovor, odgovorjeno = runda.odgovorjeno, zasluzek = runda.zasluzek)
    bottle.redirect('/igra')

@bottle.get('/konec')
def konec():
    return bottle.template('konecIgre.tpl')

bottle.run(debug=True, reloader=True)