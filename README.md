# task_manger_test

A new Flutter project for testing.

## Getting Started
The structure of project has mainApp folder that conatins the main view and its controller if we want to do some thing globaly and still working until the application is running,
and  we have global folder taht conatins the custom widgets and shared like colors file,
The app folder contains core folder that is responsible for calling apis and its models for every one,enums, services folder and utils like general_utils,
The module folder is contains all views in our application and thier controllers.
The routes folder contains the app pages and views routes.
In this project:
1. we created a LoginView with auth api and validation for empty input,after success process we will not login again until the clear the application data because we store a boolean value in local storage using shared preference that mentioned in the document (additional step we added hive as an example to store data using no sql storing).
2. I created 4 views inside main view with bottom nav bar, the first on is AllTodosView , that get all todos from server in a list view, and we applied pagenation on the view using scroll controller position, then call the same api with pagenation using query params in our request, when you press on any todo you can edit or delete it , by passing the id in the path of the url.
2.1. The second view is AddNewTodo , its a simple view with form field and validation for empty input, and call thr add new todo api, by passing data in json format in the body of the request.
2.2. the third view is a simple profile view that display the user information (user name, email, first name, last name and photo), we retrive this data from local storage , when we store the login model after logging in in shared pref or in hive.
2.3. The fourth view is MyTodos that get only todos that according to me, using geTodosByUserId api,we passing the user id after get it from loacl storage to the api in the path.
3. Now we will talk about logic, fist of all we used Getx state management, because it fast and high performance, we used controller for every view, and each controller extends from the baseController that extends from Getx controller, the base controller is in the service folder contains all logic shared by other controller loke runFullLoadingFutureFunction as in example in our code, we used dependecy injection like, Get.put for inject the controller and classes that needed in all project (Shared preference  repository and hive repository) and find them in the view , or globaly for all project in general util.
4. For APIs we have the network util class with two methods send request and multipart request , to handle all types off apis that requested(we only use send request method here), and return the response.
5. We created repository for every api, and enpoints class for similar types of api(class for auth and class for todos) in the repository we call the sendRequest method from networkUtis class and take the response and fetch the data using commonResponse class ,and we have another classes like networkConfig that dealing with headers and token passed in it.

## Packages we used:
  (get: 4.6.6) for Getx state management and handle our application state.
  (  flutter_screenutil: 5.9.0) to make our view responsive with all screens according the screen resolution and its width and hieght,
  (  mime: ^1.0.5
  http: ^1.2.1
  path: ^1.9.0
  http_parser: ^4.0.2) those four packages not neccessary because its built in flutter but we used to over controller the package version, the used to deal with apis, sending request and fetch data,
  (flutter_spinkit^5.2.1) this package used for loaders in our application.
  (bot_toast ^4.1.3) used for display the messages in toast.
  (cached_network_image^3.3.1) used to display the profile phonto that come from the server.
  (hive ^2.2.3,shared_preferences^2.2.3) the local storage that used to store token, login model for user info, and the first login boolean value.
  (lottie^3.1.2) this package is used to display assets lottie from the lottie folder in the toast.

  ## Project running
  from the lib/main.dart run the main method, or from vscode run without depugging
  
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
