# English Vocabulary
**An English Vocabulary Application Made with Flutter**

---

## GIF Demo
<img src="https://github.com/Himera19/english_vocabulary/blob/master/app_preview.gif" height="450">

## Features
- **Word Details**: Users can view detailed information about searched words.
- **Synonym Details**: Users can see the top 5 scored synonyms for a word.
- **Word Filtering**: Users can filter the meanings of words based on their types.
- **Local Storage**: The last 5 words fetched from the API are stored locally using Hive.
- **Responsive UI**: The app is designed to support various screen sizes on mobile devices.

## Key Dependencies
- **Hive**: Used to store the last 5 searched words locally.
- **Provider**: Ensures app integrity and manages state effectively.
- **Screen Util**: Enables support for different mobile screen sizes.
- **HTTP**: Handles API requests and processes the results.

---

## Requirements
- **Dart 3.5.3**
- **Flutter 3.24.3**

## Setup
1. Run `flutter run` to launch the app.

## Usage
1. **API Access**: The app fetches word information from an external API.
2. **Local Storage**: The last 5 searched words are saved in Hive, allowing offline access.
3. **Word Details**: Detailed information about the searched word is displayed.
4. **Synonym Details**: The top 5 synonyms for the searched word are shown.
5. **Filtering**: Users can filter word meanings based on word types.

---

## License
This project is licensed under the MIT License.
