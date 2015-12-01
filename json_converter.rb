require 'json'
require 'pry'

null = "null"

sunburst = {
  "trackName" => null,
  "artistName" => "A Tribe Called Quest",
  "albumName" => "The Low End theory",
  "year" => "1991",
  "link" => "Link to Music",
  "uniqueID" => "Number -- NOT String",
  "children" => [
      {"trackName"=>"Jazz","artistName"=>"A Tribe Called Quest","albumName"=>"The Low End Theory","year"=>1991,"link"=>null,"children"=>
        [
        {"trackName"=>"Don't Change Your Love","artistName"=>"Five Stairsteps","albumName"=>"Live at Yankee Stadium","year"=>1969,"link"=>null,"children"=> [
                 {"trackName"=>"Everyday Struggle","artistName"=>"The Notorious B.I.G.","albumName"=>"Ready to Die","year"=>1994,"link"=>null,"children"=>null,"value"=>1},
                 {"trackName"=>"Eat Em up L Chill","artistName"=>"LL Cool J","albumName"=>"Mama Said Knock You Out","year"=>1990,"link"=>null,"children"=>null,"value"=>1},
                 {"trackName"=>"m.A.A.dCity","artistName"=>"Kendrick Lamar feat. MOEiht","albumName"=>"Good Kid, M.A.A.D City","year"=>2012,"link"=>null,"children"=>null,"value"=>1},
                 {"trackName"=>"A Bird in the Hand","artistName"=>"Ice Cube","albumName"=>"Death Certificate","year"=>1991,"link"=>null,"children"=>null,"value"=>1},
                 {"trackName"=>"Hip Hop Hooray","artistName"=>"Naughty by Nature","albumName"=>"19 Naughty III","year"=>1993,"link"=>null,"children"=>null,"value"=>1}]
          },
          {"trackName"=>"Green Dolphin Street","artistName"=>"Lucky Thompson","albumName"=>"Friday the 13th=> Cook County Jail","year"=>1972,"link"=>null,"children"=> [
                  {"trackName"=>"Soul Flower (We've Got)","artistName"=>"Amerigo Gazaway","albumName"=>"Bizzarre Tribe=> A Quest to the Pharcyde","year"=>2013,"link"=>null,"children"=>null,"value"=>1},
                  {"trackName"=>"Get Off My Log (The Jazzfatwoody remix)","artistName"=>"Milk Dee ft. Jazzyfatnastees","albumName"=>"Never Dated","year"=>1994,"link"=>null,"children"=>null,"value"=>1}]
            }
        ]},
      {"trackName"=>"Butter","artistName"=>"A Tribe Called Quest","albumName"=>"The Low End Theory","year"=>1991,"link"=>null,"children"=>
        [
        {"trackName"=>"Gentle Smiles","artistName"=>"Gary Bartz","albumName"=>"The Shadow Do","year"=>1975,"link"=>null,"children"=>
                  [{"trackName"=>"Stress","artistName"=>"Technical","albumName"=>"Stress/This Blunt (single)","year"=>1998,"link"=>null,"children"=>null,"value"=>1},
                  {"trackName"=>"Right Here","artistName"=>"DJ Mitsu feat. Dwele","albumName"=>"The Soul Mixtape","year"=>2005,"link"=>null,"children"=>null,"value"=>1},
                  {"trackName"=>"The Theme","artistName"=>"Tek 9","albumName"=>"It’s Not What You Think It Is !?!!","year"=>1999,"link"=>null,"children"=>null,"value"=>1},
                  {"trackName"=>"Third of the Trio","artistName"=>"The Beatnuts","albumName"=>"Intoxicated Demons=> The EP","year"=>1993,"link"=>null,"children"=>null,"value"=>1}]},
        {"trackName"=>"Young and Fine","artistName"=>"Weather Report","albumName"=>"Mr. Gone","year"=>1978,"link"=>null,"children"=>
                [{"trackName"=>"Da Ntro","artistName"=>"DJ Jazzy Jeff ft. Baby and Pauly Yamz","albumName"=>"The Magnificent","year"=>2002,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"Les Anneés 2000","artistName"=>"Democrates","albumName"=>"La Voie Du Peuple ","year"=>1995,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"Soul Flower (We've Got)","artistName"=>"Amerigo Gazaway","albumName"=>"Bizzarre Tribe=> A Quest to the Pharcyde","year"=>2013,"link"=>null,"children"=>null,"value"=>1}]
          },
          {"trackName"=>"I Like Everything About You","artistName"=>"Chuck Johnson","albumName"=>"Chuck Jackson Arrives","year"=>1968,"link"=>null,"children"=>
                [{"trackName"=>"The Sober Up","artistName"=>"Mack Wilds","albumName"=>"New York=> A Love Story","year"=>2013,"link"=>null,"children"=>null,"value"=>1}]}]
      },
      {"trackName"=>"The Infamous Date Rape","artistName"=>"A Tribe Called Quest","albumName"=>"The Low End Theory","year"=>1991,"link"=>null,"children"=>
          [{"trackName"=>"10% Dis","artistName"=>"MC Lyte feat. Audio Two","albumName"=>"Lyte as a Rock","year"=>1988,"link"=>null,"children"=>
              [{"trackName"=>"I Am Myself","artistName"=>"Raw Produce feat. Mr. Lif","albumName"=>"","year"=>2001,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"Come On","artistName"=>"Billy Lawrence ft. MC Lyte","albumName"=>"Set It Off OST","year"=>1996,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"Hit Em' Up","artistName"=>"2pac feat. Outlawz","albumName"=>"Greatest Hits","year"=>1996,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"Quiet Storm (Remix)","artistName"=>"Mobb Deep ","albumName"=>"Murda Muzik","year"=>1999,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"I Love College","artistName"=>"Asher Roth","albumName"=>"Asleep in the Bread Aisle","year"=>2008,"link"=>null,"children"=>null,"value"=>1}]},
          {"trackName"=>"The Steam Drill","artistName"=>"Cannonball Adderley","albumName"=>"The Black Messiah","year"=>1972,"link"=>null,"children"=>
                [{"trackName"=>"Woo-Ha!!! Got You All in Check (The Jay Dee Other Shit Remix)","artistName"=>"Busta Rhymes ft Rampage","albumName"=>"The Coming","year"=>1996,"link"=>null,"children"=>null,"value"=>1}]},
          {"trackName"=>"Love's Gonna Get'cha (Material Love)","artistName"=>"Boogie Down Productions","albumName"=>"Edutainment","year"=>1990,"link"=>null,"children"=>
            [{"trackName"=>"First Things First","artistName"=>"Blu and Exile","albumName"=>"Below The Heavens","year"=>2007,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"If You Can't Say Love","artistName"=>"Visionaries","albumName"=>"Pangaea","year"=>2004,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"Handle the Vibe","artistName"=>"Bone Thugs-N-Harmony","albumName"=>"The Art of War","year"=>1997,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"I Don't Need Love","artistName"=>"Evidence","albumName"=>"Cats &Dogs","year"=>2001,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"The Day the Niggaz Took Over","artistName"=>"Dr. Dre","albumName"=>"The Chronic","year"=>1992,"link"=>null,"children"=>null,"value"=>1}]},
          {"trackName"=>"Is It Him or Me","artistName"=>"Jackie Jackson","albumName"=>"Jackie Jackson","year"=>1973,"link"=>null,"children"=>
                [{"trackName"=>"Revenge of the Number","artistName"=>"Portishead","albumName"=>"Numb","year"=>1994,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"War","artistName"=>"Nas feat Keon Bryce","albumName"=>"Street's Disciple","year"=>2004,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"I'm Addicted","artistName"=>"Deliquent Habits","albumName"=>"Delinquent Habits","year"=>1996,"link"=>null,"children"=>null,"value"=>1}]}]},
      {"trackName"=>"Excursions","artistName"=>"A Tribe Called Quest","albumName"=>"The Low End Theory","year"=>1991,"link"=>null,"children"=>
          [{"trackName"=>"The Soil I Tilled for You","artistName"=>"The Shades of Brown","albumName"=>"S.O.B.","year"=>1970,"link"=>null,"children"=>
                [{"trackName"=>"New Shit","artistName"=>"Tru Blu","albumName"=>"Jesus","year"=>2011,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"Have U.N.E. Pull","artistName"=>"Black Sheep","albumName"=>"A Wolf in Sheep's Clothing","year"=>1992,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"Yes","artistName"=>"Black Sheep","albumName"=>"A Wolf in Sheep's Clothing","year"=>1992,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"Mr. Incognito","artistName"=>"A Tribe Called Quest","albumName"=>"Hits, Rarities, and Remixes","year"=>2002,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"Swing It! (Jazziness)","artistName"=>"Da Bush Babees","albumName"=>"Ambushed","year"=>1993,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"I Am I Be","artistName"=>"De La Soul","albumName"=>"Buhloone Mindstate","year"=>1993,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"Ain't Nothin' but a She Thang","artistName"=>"Salt-N-Pepa","albumName"=>"Ain't Nuthin' But a She Thing","year"=>1995,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"The Riddler","artistName"=>"Method Man","albumName"=>"Batman Forever OST","year"=>1995,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"The Sound You Hear","artistName"=>"The Wiseguys","albumName"=>"Executive Suite","year"=>1996,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"Walk Like a Duck","artistName"=>"Kurious","albumName"=>"A Constipated Monkey","year"=>1996,"link"=>null,"children"=>null,"value"=>1}]},
          {"trackName"=>"A Chant for Bu","artistName"=>"Art Blakely and the Jazz Messengers","albumName"=>"Buhaina","year"=>1973,"link"=>null,"children"=>
                [{"trackName"=>"Ya Mama and Stuff","artistName"=>"Amerigo Gazaway","albumName"=>"Bizzarre Tribe=> A Quest to the Pharcyde","year"=>2013,"link"=>null,"children"=>null,"value"=>1}]},
          {"trackName"=>"Time Is Running Out","artistName"=>"The Last Poets","albumName"=>"This Is Madness","year"=>1991,"link"=>null,"children"=>
              [{"trackName"=>"Due our Time","artistName"=>"Justice System","albumName"=>"Sounds of the Rooftop","year"=>1999,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"Timeless","artistName"=>"Showbiz & A.G.","albumName"=>"Mugshot Music=> Preloaded Remixes","year"=>2012,"link"=>null,"children"=>null,"value"=>1},
                {"trackName"=>"The Listening","artistName"=>"Little Brother","albumName"=>"The Listening","year"=>2003,"link"=>null,"children"=>null,"value"=>1}]}]},
      {"trackName"=>"Buggin Out","artistName"=>"A Tribe Called Quest","albumName"=>"The Low End Theory","year"=>1991,"link"=>null,"children"=>
          [{"trackName"=>"Minya's the Mooch","artistName"=>"Jack Dejohnette's Directions","albumName"=>"New Rags","year"=>1977,"link"=>null,"children"=>
            [{"trackName"=>"F.A.G. (Fake Ass Gangsta)","artistName"=>"M.O.P.","albumName"=>"To The Death","year"=>1993,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"The Kid is Crazy","artistName"=>"A.D.O.R.","albumName"=>"The Concrete","year"=>1994,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Uptown Shit","artistName"=>"Kurious feat. Kadi","albumName"=>"A Constipated Monkey","year"=>1994,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Hits From the Bong (T-Ray Mix)","artistName"=>"Cypress Hill","albumName"=>"Black Sunday","year"=>1993,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Freestyle?","artistName"=>"Masta Ace","albumName"=>"Sittin on Chrome","year"=>1995,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Breakadawn (Foncett Power Radio Mix)","artistName"=>"De La Soul","albumName"=>"Buhloone Mindstate","year"=>1993,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Hostile","artistName"=>"Erick Sermon","albumName"=>"No Pressure","year"=>1993,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Wu-Tang Martial Expert","artistName"=>"Clivaringz","albumName"=>"I","year"=>2007,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Wu-Tang=> 7th Chamber","artistName"=>"Wu-Tang Clan","albumName"=>"Enter the Wu-Tang (36 Chambers)","year"=>1993,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Come on Everybody","artistName"=>"Run DMC","albumName"=>"Down with the King","year"=>1993,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Give the Drummer Some","artistName"=>"Ultramagnetic MC's","albumName"=>"Critical Beatdown","year"=>1998,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Flute Loop","artistName"=>"Beastie Boys","albumName"=>"Ill Communication","year"=>1994,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Whutcha Want?","artistName"=>"Nine","albumName"=>"Nine Livez","year"=>1995,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Can I Kick It?","artistName"=>"A Tribe Called Quest","albumName"=>"People's Instinctive Travels and the Paths of Rhythm","year"=>1990,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Amazing","artistName"=>"Grand Puba","albumName"=>"2000","year"=>1995,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Understand?","artistName"=>"Deda","albumName"=>"The Original Baby Pa","year"=>2003,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Le Fleu","artistName"=>"IAM","albumName"=>"Ombre est lumiere","year"=>1993,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Gangsta Bitch","artistName"=>"Apache","albumName"=>"Apache Ain't Shit","year"=>1993,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Enta Da Stage","artistName"=>"Black Moon","albumName"=>"Enta Da Stage","year"=>1993,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Get On Up","artistName"=>"Fat Joe","albumName"=>"Represent","year"=>1993,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Psycho Dwarf","artistName"=>"The Beatnuts","albumName"=>"The Beatnuts=> Street Level","year"=>1993,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Man on","artistName"=>"Tony Da Skitzo","albumName"=>"Who U Talkin' 2","year"=>1995,"link"=>null,"children"=>null,"value"=>1},
{"trackName"=>"Think Twice","artistName"=>"Live Poets","albumName"=>"Whats It All About","year"=>1996,"link"=>null,"children"=>null,"value"=>1}]}]}]
}

network = {"nodes"=>[], "links"=>[]}

def conversion (json, output)
  json.map do |k,v|
    if k == "children" && v != 'null'
      v.each {|c| conversion(c,output)}
    end
    if k != "children" || (k=='children' && v=='null') 
      if k == 'trackName'
        output["nodes"].push({k => v})
      elsif k != 'trackName'
        output["nodes"].last[k] = v
      end
      # puts output["nodes"].last
      # output["nodes"].push(k => v)
    end
  end
  output
end

conversion(sunburst, network)

puts network
