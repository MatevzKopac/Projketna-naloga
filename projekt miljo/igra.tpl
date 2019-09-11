<html>
    <head>
        <title>MILIJONAR</title>
    </head>
    %if odgovorjeno != pravilen and odgovorjeno != "":
        <body style="background-color: #cc3300">
    %else:
        <body style="background-color: #003399">
    %end
        <div style="padding-top: 50px;">
            <h1>KDO ŽELI POSTATI MILIJONAR</h1>
        </div>
        <div>   
            <h2 class="question"> {{vprasanje}} </h2>
        </div>
                <table style="width:100%;">
                    <tr>
                        <td class="levo"><button class="answers">A: {{odgovori[0]}}</button></td>
                        <td class="desno"><button class="answers">B: {{odgovori[1]}}</button></td>
                    </tr>
                    <tr>
                        <td class="levo"><button class="answers">C: {{odgovori[2]}}</button></td>
                        <td class="desno"><button class="answers">D: {{odgovori[3]}}</button></td>
                    </tr>
                    %if odgovorjeno == "":
                        <tr align="center">
                            <td colspan="2" style="padding-top: 20px;"><form action="/igra">
                                <input type="text" name="odg" autocomplete="off" style="text-transform: uppercase;">
                                <input type="submit" value="Zadnji odgovor">
                                </form>
                            </td>
                        </tr>   
                    %end
                    <tr>
                        % if odgovorjeno == pravilen: 
                            <td colspan="2" class="odgovor"><p>Vaš odgovor je pravilen. Trenutno imate {{100*2**(zasluzek-1)}} €!</p></br>
                            <button class="gumb" onclick="window.location.href = 'http://127.0.0.1:8080/igra';">Naslednje vprašanje</button></td>
                        % elif odgovorjeno != pravilen and odgovorjeno != "":
                            <td colspan="2" class="odgovor"><p>Vaš odgovor ni pravilen. Osvojili ste {{100*2**(zasluzek-2)}} €!</p></br>
                            <button class="gumb" onclick="window.location.href = 'http://127.0.0.1:8080/';">Vrnitev na začetek</button></td>
                        % end
                        
                    </tr>
    </body>
</html>

<style type="text/css" media="screen">
h1 {
    font-family: arial;
    font-style: black;
    color: white; 
    text-align: center;
    font-size: 80px;
}
h2 {
    text-align: center;
    font-size: 50px;
    color: white;
    padding-bottom: 50px;
}
td {
    text-align: center;
}
.levo{
    padding-left: 300px;
}
.desno {
    padding-right: 300px;
}
.answers {
    width: 500px; 
    height: 100px;
    text-align: center; 
    font-size: 30px;
    margin: auto;
}
input {
    width: 200px; 
    height: 50px;
}
.odgovor {
    color: white;
    font-size: 50px;
    padding-top: 50px;
    text-align: center;
}
.gumb {
    width: 200px; 
    height: 50px;
}
</style>