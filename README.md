# Anywhere app Implementation Document


# Multiple Variation of App:

For creating multiple variations of app, I implemented it in 2 ways.
1.	### Fastlane: (White Label):
If we are creating a white label app which will be carved out into multiple apps with different branding and configuration this approach is very helpful. I have added a globalconfig.xcconfig file.
Added a Fastlane script which will apply branding based on the command. It is a working script, but data is changed using hardcoded values, ideally we should be getting the values form any API or remote repository (we will download and apply the values). The script will apply branding to the global config file and after that will create a ipa using the configuration. (creating ipa is not implemented in the project). To run the Fastlane script we can use this command:

fastlane createAPP series:"TheWire"

2.	### Separate schemes for 2 variations:
If we ever only have 2 variation, we can simply create 2 Schemes. Each scheme will pick value from different xcconfig file. Create 2 configs simpsons.xcconfig, thewire.xcconfig. When we run the app all the values are picked form this config for their respective app.

# Architecture and Implementation of App:

1.	Followed simple MVVM architecture, even though don’t have much to implement in viewmodel. Added only oen view model.
2.	Implemented Splitview controller for List and detail screen.
3.	For title value as we don’t have title in the response from API, I took the text field value and speperated string with character “_” and used the first part as title.
4.	Image in detail view is displayed, downloaded image using simple UIImage extension. Did not add any multithreading or any complex logic. If image is not there, default image will be displayed.
5.	For search used native ios UISearch bar. 
6.	Created Character Model for each character. Modified the api response values using coding keys to have it in iOS standard format in our model.
7.	All Image URL creation and title split is done in CharacterModel itself globally.
8.	App content is being displayed as expected in portrait and landscape mode.
9.	No external library is used except Fastlane.
10.	Added Anywhere Image for logo and random image for app Icons.

# API Implementation:
1.	Used Basic URLSession for communication.
2.	Idea is to create a Network Manager whose sole purpose is to do API call. No data manipulation or decoding will happen here. All network call will go throug NetworkManager class. Ideally this is where we will have ssl pinning and any other logic which will affect all API calls.
3.	For getting series characters, created a CharacterService class which will ideally have all the service methods used to get characters and their information. We only got one api, so that will be here.
4.	List View model communicates with CharacterService to fetch data. 
5.	Activity indicator is shown when api call is being made.
6.	Ideally also need to implement custom APIRequest protocol and create APIRequests for each call using the protocol. But did not implement here due to time.

# Screenshots:
[https://github.com/nvenkat999/AnywhereApp/blob/main/Implementation%20Document.docx]

