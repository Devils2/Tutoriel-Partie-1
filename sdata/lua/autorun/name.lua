concommand.Add( "name.", function( ply, cmd, args )

	stad = 1
	causedeath = "inconnue"
	names = table.Random( Prenom ) .. " " .. table.Random( nom )
   	local death = os.date( "%d/%m/%Y à %H:%M " , Timestamp )
    yourname = ply:Nick()
    Prenom = { "Jacob", "Michael", "Matthew", "Joshua", "Nicholas", "Christopher", "Joseph", "Ethan", "Andrew", "Daniel", "William", "Clement", "Anthony", "Jonathan", "Zachary", "David", "Tyler", "Christian", "John", "Alexander", "Ryan", "Dylan", "Brandon", "James", "Brian", "Justin", "Caleb", "Austin", "Samuel", "Jose", "Benjamin", "Nathan", "Kevin", "Logan", "Cameron", "Eric", "Gabriel", "Robert", "Noah", "Thomas", "Jordan", "Aidan", "Hunter", "Connor", "Jason", "Jaden", "Sean", "Elijah", "Kyle", "Stephen", "Jackson", "Aaron", "Isaiah", "Jack", "Devin", "Luke", "Angel", "Luis", "Isaac", "Juan", "Mason", "Adam", "Nathaniel", "Gavin", "Evan", "Dominic", "Carlos", "Charles", "Caden", "Alex", "Brayden", "Cody", "Jesus", "Ian", "Cole", "Lucas", "Adrian", "Timothy", "Colin", "Jalen", "Tristan", "Jared", "Seth", "Sebastian", "Julian", "Richard", "Blake", "Mark", "Patrick", "Jesse", "Brendan", "Garrett", "Miguel", "Chase", "Antonio", "Xavier", "Jeremiah", "Derek", "Alejandro", "Alan"  }
    nom = { "SMITH", "JOHNSON", "WILLIAMS", "JONES", "BROWN", "DAVIS", "WILSON", "MOORE", "TAYLOR", "ANDERSON", "THOMAS", "JACKSON", "WHITE", "HARRIS", "MARTIN", "THOMPSON", "GARCIA", "MARTINEZ", "ROBINSON", "CLARK", "RODRIGUEZ", "LEWIS", "LEE", "WALKER", "HALL", "ALLEN", "YOUNG", "HERNANDEZ", "KING", "WRIGHT", "LOPEZ", "HILL", "SCOTT", "GREEN", "ADAMS", "BAKER", "GONZALEZ", "NELSON", "CARTER", "MITCHELL", "PEREZ", "ROBERTS", "TURNER", "PHILLIPS", "CAMPBELL", "PARKER", "EVANS", "EDWARDS", "COLLINS", "STEWART", "SANCHEZ", "MORRIS", "ROGERS", "REED", "COOK", "MORGAN", "BELL", "MURPHY", "BAILEY","RIVERA", "COOPER", "RICHARDSON", "COX", "HOWARD", "WARD", "TORRES", "PETERSON", "GRAY", "RAMIREZ", "JAMES", "WATSON", "BROOKS", "KELLY", "SANDERS", "PRICE", "BENNETT", "WOOD", "BARNES", "ROSS", "HENDERSON", "COLEMAN", "JENKINS", "PERRY", "POWELL", "LONG", "PATTERSON", "HUGHES", "FLORES", "WASHINGTON", "BUTLER", "SIMMONS", "FOSTER", "GONZALES", "BRYANT", "ALEXANDER", "RUSSELL", "GRIFFIN", "DIAZ", "HAYES" }

	hook.Add( "HUDPaint", "menu1", function()
		draw.RoundedBox(0,0,0,2000,2000,Color(76,76,76 , 200))
		draw.DrawText( "Death Note:", "TargetID", ScrW() * 0.5, ScrH() * 0.25, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
		draw.DrawText( "M/Mme " .. yourname .. " ,", "TargetID", ScrW() * 0.5, ScrH() * 0.35, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
		draw.DrawText( " Est décédé le " .. death .. " ,", "TargetID", ScrW() * 0.5, ScrH() * 0.40, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
		draw.DrawText( " Cause du décès: " .. causedeath , "TargetID", ScrW() * 0.5, ScrH() * 0.45, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )	
		draw.DrawText( "  ! Ce personnage RolePlay est morts ! "  , "TargetID", ScrW() * 0.5, ScrH() * 0.55, Color(220, 22, 22, 255), TEXT_ALIGN_CENTER )
		draw.DrawText( "L'equipe d'administrastion est disponible pour vous aider." , "TargetID", ScrW() * 0.5, ScrH() * 0.60, Color(110, 9, 9, 255), TEXT_ALIGN_CENTER )
		draw.DrawText( "Faite 'Espace' pour continuer" , "TargetID", ScrW() * 0.5, ScrH() * 0.64, Color(110, 9, 9, 255), TEXT_ALIGN_CENTER )		

	end)

	hook.Add( "KeyPress", "keypressspace", function( ply, key )
	if ( key == IN_JUMP ) then
		if stad == 1 then
			ply:ConCommand( "say /name " .. names )
			hook.Remove("HUDPaint", "menu1")
			hook.Remove( "KeyPress", "keypress1")
			hook.Add( "HUDPaint", "menu2", function()
				draw.RoundedBox(0,0,0,2000,2000,Color(76,76,76 , 200 ))
				draw.DrawText( "Boite mail:", "TargetID", ScrW() * 0.5, ScrH() * 0.25, Color(218, 152, 15, 255), TEXT_ALIGN_CENTER )
				draw.DrawText( "Bienvuenue, M/Mme " .. names .. " à NewExton", "TargetID", ScrW() * 0.5, ScrH() * 0.35, Color(228, 194, 153, 255), TEXT_ALIGN_CENTER )
				draw.DrawText( "Nous somme à votre disposition pour tout demande " , "TargetID", ScrW() * 0.5, ScrH() * 0.40, Color(228, 194, 153, 255), TEXT_ALIGN_CENTER )
				draw.DrawText( "d'aide au: Logements, Taxes, Portion alimentaire ... " , "TargetID", ScrW() * 0.5, ScrH() * 0.45, Color(228, 194, 153, 255), TEXT_ALIGN_CENTER )
				draw.DrawText( "Voici en guise d'accueil:  100$ " , "TargetID", ScrW() * 0.5, ScrH() * 0.55, Color(228, 194, 153, 255), TEXT_ALIGN_CENTER )
				draw.DrawText( "Sous-Signer: l'Adjoint du maire" , "TargetID", ScrW() * 0.5, ScrH() * 0.65, Color(228, 194, 153, 255), TEXT_ALIGN_CENTER )



			end)

		end
		
		timer.Simple( 1 , function ()
		stad = 2
 
		end)

	end
	timer.Simple( 10 , function ()
	hook.Remove("HUDPaint", "menu2")

	end)

end )

end)



 



