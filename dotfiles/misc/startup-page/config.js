// ╔╗ ╔═╗╔╗╔╔╦╗╔═╗
// ╠╩╗║╣ ║║║ ║ ║ ║
// ╚═╝╚═╝╝╚╝ ╩ ╚═╝
// ┌─┐┌─┐┌┐┌┌─┐┬┌─┐┬ ┬┬─┐┌─┐┌┬┐┬┌─┐┌┐┌
// │  │ ││││├┤ ││ ┬│ │├┬┘├─┤ │ ││ ││││
// └─┘└─┘┘└┘└  ┴└─┘└─┘┴└─┴ ┴ ┴ ┴└─┘┘└┘

const CONFIG = {
	// ┌┐ ┌─┐┌─┐┬┌─┐┌─┐
	// ├┴┐├─┤└─┐││  └─┐
	// └─┘┴ ┴└─┘┴└─┘└─┘

	// General
	name: 'kamilo',
	imageBackground: true,
	openInNewTab: true,
	twelveHourFormat: true,
	timeZone: 'America/Bogota',

	// Greetings
	greetingMorning: 'Good morning!',
	greetingAfternoon: 'Good afternoon,',
	greetingEvening: 'Good evening,',
	greetingNight: 'Go to Sleep!',

	// Layout
	bentoLayout: 'lists',

	// Weather
	weatherKey: '8b05d62206f459e1d298cbe5844d7d87', // Write here your API Key
	weatherIcons: 'Nord', // 'Onedark', 'Nord', 'Dark', 'White'
	weatherUnit: 'C', // 'F', 'C'
	language: 'es', // More languages in https://openweathermap.org/current#multi

	trackLocation: true, // If false or an error occurs, the app will use the lat/lon below
	defaultLatitude: '19.593',
	defaultLongitude: '-99.250',

	// Autochange
	autoChangeTheme: true,

	// Autochange by OS
	changeThemeByOS: true,

	// Autochange by hour options (24hrs format, string must be in: hh:mm)
	changeThemeByHour: false,
	hourDarkThemeActive: '18:30',
	hourDarkThemeInactive: '07:00',

	// ┌┐ ┬ ┬┌┬┐┌┬┐┌─┐┌┐┌┌─┐
	// ├┴┐│ │ │  │ │ ││││└─┐
	// └─┘└─┘ ┴  ┴ └─┘┘└┘└─┘

	firstButtonsContainer: [
		{
			id: '1',
			name: 'Github',
			icon: 'github',
			link: 'https://github.com/',
		},
		{
			id: '2',
			name: 'Mail',
			icon: 'mail',
			link: 'https://mail.protonmail.com/',
		},
		{
			id: '3',
			name: 'Todoist',
			icon: 'trello',
			link: 'https://todoist.com',
		},
		{
			id: '4',
			name: 'Calendar',
			icon: 'calendar',
			link: 'https://calendar.google.com/calendar/r',
		},
		{
			id: '5',
			name: 'Reddit',
			icon: 'glasses',
			link: 'https://reddit.com',
		},
		{
			id: '6',
			name: 'Odysee',
			icon: 'youtube',
			link: 'https://odysee.com/',
		},
	],

	secondButtonsContainer: [
		{
			id: '1',
			name: 'Music',
			icon: 'headphones',
			link: 'https://open.spotify.com',
		},
		{
			id: '2',
			name: 'twitter',
			icon: 'twitter',
			link: 'https://twitter.com/',
		},
		{
			id: '3',
			name: 'bot',
			icon: 'bot',
			link: 'https://discord.com/app',
		},
		{
			id: '4',
			name: 'Amazon',
			icon: 'shopping-bag',
			link: 'https://amazon.com/',
		},
		{
			id: '5',
			name: 'Hashnode',
			icon: 'pen-tool',
			link: 'https://hashnode.com/',
		},
		{
			id: '6',
			name: 'Figma',
			icon: 'figma',
			link: 'https://figma.com/',
		},
	],

	// ┬  ┬┌─┐┌┬┐┌─┐
	// │  │└─┐ │ └─┐
	// ┴─┘┴└─┘ ┴ └─┘

	// First Links Container
	firstlistsContainer: [
		{
			icon: 'star',
			id: '1',
			links: [
				{
					name: 'IBM',
					link: 'https://sb-auth.skillsbuild.org/login?client_id=yl-internal-adopter&learning_path=https%3A%2F%2Fskills.yourlearning.ibm.com%2F&redirect_uri=https%3A%2F%2Fskills.yourlearning.ibm.com%2Foauth%2Fcallback&referer=skills.yourlearning.ibm.com&response_type=code&scope=openid+email',
				},
				{
					name: 'Correo Uniminuto',
					link: 'https://login.microsoftonline.com/common/oauth2/authorize?client_id=00000002-0000-0ff1-ce00-000000000000&redirect_uri=https%3a%2f%2foutlook.office.com%2fowa%2f&resource=00000002-0000-0ff1-ce00-000000000000&response_mode=form_post&response_type=code+id_token&scope=openid&msafed=1&msaredir=1&client-request-id=96eda541-8cab-28ef-8599-a865d5c7150c&protectedtoken=true&claims=%7b%22id_token%22%3a%7b%22xms_cc%22%3a%7b%22values%22%3a%5b%22CP1%22%5d%7d%7d%7d&nonce=638621984779337115.fde99c68-fe47-47e9-a442-5efa7bbd0c14&state=Dcu9DoIwFEDhou_iVmlL6e0diIPGMOiCJhq2_lwSiQQDBOPb2-E728kYY9tkk2QihYEprFESrQbAogApy30XCTEYyzvSwDUQcqe14iV1DryPIkidpfeUj1-XH-bFLVTJ3UTxNVFY7mPl6kaE-mouP1zjs5m9wuky4NAO7769lb1XYvWP88cf7R8',
				},
				{
					name: 'ChatGPT',
					link: 'https://chat.openai.com/',
				},
				{
					name: 'Gemini',
					link: 'https://gemini.google.com/app',
				},
			],
		},
		{
			icon: 'tv',
			id: '2',
			links: [
				{
					name: 'YouTube',
					link: 'https://www.youtube.com',
				},
				{
					name: 'Netflix',
					link: 'https://www.netflix.com',
				},
				{
					name: 'calculadora',
					link: 'https://editor.codecogs.com/',
				},
				{
					name: 'Geogebra',
					link: 'https://www.geogebra.org/classic?lang=en',
				},
			],
		},
	],

	// Second Links Container
	secondListsContainer: [
		{
			icon: 'square-user-round',
			id: '1',
			links: [
				{
					name: 'latex Code',
					link: 'https://editor.codecogs.com/',
				},
				{
					name: 'emat',
					link: 'https://www.emathhelp.net/es/calculators/linear-algebra/null-space-calculator/?i=%5B%5B2%2C4%2C0%2C-2%5D%2C%5B0%2C0%2C3%2C0%5D%2C%5B0%2C1%2C3%2C0%5D%5D',
				},
				{
					name: 'symbolab',
					link: 'https://es.symbolab.com/',
				},
				{
					name: 'matway',
					link: 'https://www.mathway.com',
				},
			],
		},
		{
			icon: 'binary',
			id: '2',
			links: [
				{
					name: 'descargas',
					link: 'file:///home/kamilo/Descargas/',
				},
				{
					name: 'C#',
					link: 'https://www.w3schools.com/cs/index.php',
				},
				{
					name: 'java',
					link: 'https://www.w3schools.com/java/java_intro.asp',
				},
				{
					name: 'Python',
					link: 'https://www.w3schools.com/python/default.asp',
				},
			],
		},
	],
};
