# Weather whiz BE

Welcome to the Weather Whiz repository! This service provides users with current or forecast weather information for a location and daily weather notifications

## Table of Contents

1. [Features](#features)
2. [Setup](#setup)
3. [Configuration](#configuration)
4. [Usage](#usage)
5. [Contributing](#contributing)
6. [License](#license)

## Features

- **User Authentication:** Allows users to register, login, and manage their accounts securely.
- **Current weather information:** Supports the management of music tracks, albums, artists, and playlists.
- **Forecast weather information:** Enables streaming of music tracks with efficient handling of audio data.
- **Daily notify weather notification to user:** Provides search functionality to find music tracks, albums, and artists.

## Setup

Make sure you have installed Ruby and Rails. I recommend using [rvm](https://github.com/rvm/rvm) to manage Ruby and Rails versions.

To set up the project, follow these steps:

1. **Clone the Repository:** Clone this repository to your local machine using `git clone`.

2. **Install Dependencies:** Navigate to the project directory and install the dependencies using Bundler. Run `bundle install` to install all required gems.

3. **Database Setup:** Set up the database name, password, required for the backend system in file `config/database.yml`.

4. **Environment Configuration:** Configure environment variables required for the backend. These variables may include database connection settings, API keys, and security parameters. You can use a tool like dotenv to manage environment variables.

## Configuration

The backend system can be configured using environment variables. Here are the key environment variables you may need to set:

- `USER_JWT_PRIVATE_KEY`: RSA PRIVATE KEY FOR USER.
- `USER_JWT_PUBLIC_KEY`: RSA PUBLIC KEY FOR USER.
- `RAILS_ENV`: THE RAILS ENVIRONMENT.
- `PORT`: PORT OF APPLICATION.
- `MONGODB_HOST`: MONGODB HOST URL
- `WEATHER_API_KEY`: Weather api key, get [here](https://www.weatherapi.com)
- `WEATHER_API_HOST`: Weather API host, default [http://api.weatherapi.com/v1](http://api.weatherapi.com/v1)
- `MAIL_ACCOUNT`: Gmail account.
- `MAIL_PASSWORD`: Gmail password
Or you can check in file `.env.example`

Make sure to set these variables according to your environment before starting the server.

## Usage
Start application with command: `rails s`, application will run on port config in env (default is 3000)

Once the backend server is up and running, you can interact with it using the provided APIs. 

The API documentation can be found:
- User api docs: [user](http://localhost:3000/user-api-docs)

You can use tools like Postman or curl to make API requests and test the functionalities provided by the backend system.

## Contributing

Contributions to the Streaming Music Backend are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

Before contributing, please read the [Contribution Guidelines](CONTRIBUTING.md) for instructions on how to contribute to this project.

## License

This project is licensed under the [MIT License](LICENSE).
