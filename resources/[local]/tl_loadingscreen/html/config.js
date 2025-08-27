/*=================================================================*\
/* By: 			|	Nevera Development  							|
/* FiveM: 		|	https://forum.cfx.re/u/neveradevelopment		|
/* Discord: 	|	https://discord.gg/NeveraDev/tw28AqrgWU  		|
/*=================================================================*/
/* If you have any problems you can contact us via discord. <3     */


var staff_team = [

	{
		"name":"Steven Listiandi",
		"image":"https://cdn.discordapp.com/attachments/1076839332247248946/1409335624896483480/pabos.png?ex=68ad0195&is=68abb015&hm=83b0e07ada67fcfa49bfdd50c5ba867627bddef9c67ada2c24d8054e230c635e&",
		"rank":"Owner"
	},
	{
		"name":"Dafkur",
		"image":"https://avatars.githubusercontent.com/u/72376750?v=4",
		"rank":"Developer"
	},
    {
		"name":"Agustian Putra",
		"image":"https://avatars.githubusercontent.com/u/183733588?s=400&u=dc14c64c39c6a5ae00a90a0a4843bc27dd746b10&v=4",
		"rank":"Developer"
	}

]

const tipsConfig = [
    {
        title: "Tip 1 (short)",
        text: "Always wear your seatbelt when driving in Los Santos.",
        img: "https://placehold.co/314x176/EEE/31343C",
        timeout: 10 // seconds
    },
    {
        title: "Tip 2 (long)",
        text: "Explore different jobs on the server, like taxi driving, delivery missions, or even criminal activities. Each job has its own rewards and risks. Remember to manage your time wisely, avoid unnecessary conflicts, and cooperate with other players to maximize your gains and enjoy the roleplay experience to the fullest. Take advantage of special events and seasonal activities to earn unique rewards. Always keep an eye on the map for dynamic missions and spontaneous opportunities, and make sure your character is properly equipped for any challenge that comes your way. Building relationships with other players can also unlock new roles and adventures, making every session unpredictable and exciting.",
        img: "https://placehold.co/314x176/EEE/31343C",
        timeout: 10 // seconds
    },
    {
        title: "Tip 3 (empty-image)",
        text: "Keep backup gear: weapons, vehicles, and medical kits are essential for surviving unexpected situations.",
        img: "",
        timeout: 10 // seconds
    },
    {
        title: "Tip 4 (no image)",
        text: "Read the server rules carefully and respect roleplay guidelines. Following the rules ensures a better experience for everyone.",
        timeout: 10 // seconds
    },
    {
        title: "Tip 5 (local-image)",
        text: "Keep backup gear: weapons, vehicles, and medical kits are essential for surviving unexpected situations.",
        img: "/tips/tip1.jpg",
        timeout: 10 // seconds
    },
];



// Staff Settings
const showStaffTeam = true
const showTipList = true


// orange
// red
// blue
// green
// pink
// purple
const theme = "red"

// ==== WINTER UPDATE !! ==== \\
const enableWinterUpdate = false
// ==== WINTER UPDATE !! ==== \\


// Text settings
const name = "<strong>TRI</strong>ADS"
const underName = "LEA<b>GUE</b>"
const desc = "Sabar mas lagi loading..."


// Social media
const discord = ""  // If = "" then icon will not show up on screen
const instagram = ""	// https://example.com
const youtube = "" 		// https://example.com
const twitter = "" 		// https://example.com
const tiktok = ""  		// https://example.com
const facebook = ""		// https://example.com
const twitch = "" 		// https://example.com
const github = "" 		// https://example.com


// Video Settings
const videoBlur = 0
var videoOpacity = 1


// Example link: https://www.youtube.com/watch?v=abcdefgh
const youtubeVideo = "https://youtu.be/WGS3RccAVDU?si=97GRv1mWmZvU7QfJ"
const showYoutubeVideo = true

// Local Video
const enableLocalVideo = false

// Local audio
const localAudio = true



// HELP //

//-- YOUTBE
//-- LOCAL AUDIO
// if localAudio is true, then loading will load "audio.mp3" file and play it except youtube audio.
// if localAudio is false, then loading will load youtube audio.

//-- LOCAL VIDEO
// if enableLocalVideo is true, then loading will load "video.webm" file and play it except youtube video.
// If localVideo is enabled, showYoutubeVideo is automatically disabled.
// You can only import a video from either YouTube or local. Local video taking priority.