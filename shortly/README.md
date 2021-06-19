### README UPDTADE

Hi. My name is Diego.
I'm a brazilian developer from Belo Horizonte. And it's a pleasure to show you what I did.

First of all. The packages I choose:

    - GetX - It's almost a framework inside flutter. It gives you a bunch of features that makes development faster and easier. It's a dependency injection, navigation, screen state manager and it has a lot of cool stuff ˆˆ.

    - Multiple_result - It´s a package that supports the development sending data in a same instance type. Doing that you will have Error or Success result at the same method call. With result in hands you can do whatever you want with it. You can call a success or a error method to handle with that.

    - Dio - It´s a great http client. It helps a lot in some cases.

    - GoogleFonts - It´s easier to import and use in your text themes.

    - Sqlite - Database to storage all data from API requests.

    - Path_provider - Package to help you access the smartphone filesystem.

    - Equatable - Used to compare instances of same type and check if they divide the same information.

The App Architecture
The app it's based on Clean Archictecure from Uncle Bob

We have here to main folders:
 - core - Files that supports all users interaction.
 - shared - Files that are going to provide resorces to core layer.

Inside Core
 - Presentation
  - Pages - Files with Widgets to represent elements on screen
  - Controllers - Controllers for the page files. They are gonna have all the business logic to make everything work perfectly.
  - Bindings - These files will provide all the dependencies to the shown screen.

- Domain
  - Repository Contract - An Abstract class with all methods used to that context. This file is a bridge between Domain and Data layers. It will detach domain and data layers, and doing that, it will let futures maintenances easier to make it.
  - UseCases - A lot of files that represents system or user cases. They will have a repository contract to make this domain/data conversation happen. They are created based on a context and always using a verb as class name. E.g GetDataUseCase, SaveDataUseCase, etc.

- Data
 - Models - Object that will provide or receive data from external enviroment.
 - Entities - Object that will provide data to the screen. This one is different from Clean Architecture. In Clean Architecture we use Entities in the domain layer. I set them here because they will have a mapper method. This mapper method it´s nothing more than a conversor. Let me explain. Imagine you have receive an integer value from API but you need to show a String instead on the Screen. You will have to cast that data right ? So in the data source layer I make this happen. I convert everything thats gonna need to be converted  in this conversation Screen - API/DataBase. Models becoming Entities and vice and versa.
 - Repository Implementation - This repository it's the repository implementation it self. This layer is responsible to know which data source will be called, local or remote.
 - DataSources - These are the last layers. They comunicate with database and API's calls. Nothing new here.

Inside Shared
 - We are going to have Widgets, String, Colors, Themes, Styles and base files. They are gonna provide every resource to make the app run. The app is ready to change to darkmode if need it. I tried to set all colors as I thought it would fit into the material scheme color as well. 

- About the Widgets folder
 - I tried to use Atomic Design pattern do make it happen. Usually this is provided from a UI Designer in a Design System, so, sorry if I made some sort of mistake here.

- I made the app proportional to any screen. So you can test this in a small or big screen. The effect will be the same. 

- Important to say. I developed this app in a Mac M1. So I couldn't test the app in an Android Emulator. Everything I did was on a IOS Emulator.

- Thanks to get in here!! I'm looking foward to explain everything into a call.  
- My contacts:
E-mail: diego.pontes87@gmail.com
Phone: +55-31-991489871









### Objective

Using Dart and Flutter, your challenge is to build out a URL shortening mobile app, integrate with the [shrtcode API](https://app.shrtco.de/docs), and get it looking as close to the design as possible.

### Brief

URL shortening is a technique on the Web in which a Uniform Resource Locator (URL) may be made substantially shorter and still direct to the required page. This is achieved by using a redirect that links to the web page that has a long URL. For example, the URL "https://example.com/assets/category_B/subcategory_C/Foo/" can be shortened to "https://example.com/Foo", and the URL "http://example.com/about/index.html" can be shortened to "https://goo.gl/aO3Ssc ".

Your challenge is to build a Flutter app, integrate with the [shrtcode API](https://app.shrtco.de/docs) and get it looking as close to the design as possible.

Your users should be able to:

-   View the optimal layout for the mobile app depending on their device's screen size
-   Shorten any valid URL
-   See a list of their shortened links ("Link History")
-   Copy the shortened link to their clipboard in a single click
-   Delete a shortened link from their Link History
-   Receive an error message when the `form` is submitted if:
    -   The `input` field is empty

Your task is to build out the project to the designs inside the `/design` folder.
See the designs in Figma here: https://bit.ly/330dJxN
See the designs as a video here: https://bit.ly/3eEYboF

You will find all the required assets in the `/images` folder. The assets are already optimized. The designs are in JPG static format. This will mean that you'll need to use your best judgment for styles such as `font-size`, `padding`, and `margin`.

There is also a `style-guide.md` file containing the information you'll need, such as color palette and fonts.

### Evaluation Criteria

-   **Dart** best practices
-   Show us your work through your commit history
-   We're looking for you to produce working code, with enough room to demonstrate how to structure components in a small program
-   Completeness: did you complete the features?
-   Correctness: does the functionality act in sensible, thought-out ways?
-   Maintainability: is it written in a clean, maintainable way?
-   Testing: is the code adequately tested?

### Deliverables

Make sure to include all source code in the repository.

### CodeSubmit

Please organize, design, test, and document your code as if it were going into production - then push your changes to the master branch. After you have pushed your code, you may submit the assignment on the assignment page.

**Have fun building!** 🚀

The Apollon Fulfillment GmbH Team
