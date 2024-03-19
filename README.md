# GigYeah AI Engine

The GigYeah AI Engine is a Flask-based web application designed to provide an AI Support  for GigYeah

## Features

- Provides support to GigYeah with everything AI

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them:

- Python 3.8+
- Poetry for dependency management
- Git (optional, for cloning the repository)

### Installing

A step-by-step series of examples that tell you how to get a development environment running:

1. **Clone the Repository (Optional)**:
   ```shell
   git clone https://your-repository-url/gigyeah-ai-engine.git
   cd gigyeah-ai-engine
   ```
   
2. **Install Dependencies**:
   ```shell
   poetry install
   ```

3. **Set Up Environment Variables**:
   Copy the `.env.example` file to `.env` and modify it according to your local environment.

4. **Run the Application**:
   ```shell
   flask run
   ```
5. **Run using Docker**

#### For Development

**Build**

```
docker build . --target development -t gigyeah-ai-engine-dev
```

**Run**

```
docker run -p 6000:6000 -t gigyeah-ai-engine-dev
```

**For Production**

**Build**

```
docker build . --target production -t gigyeah-ai-engine-prod
```

**Run**

```
docker run -p 8000:8000 gigyeah-ai-engine-prod
```

Visit `http://127.0.0.1:5000/` in your web browser to view the application.

## Documentation

For more detailed information on project setup, structure, and deployment, please refer to the following guides:

- [Project Structure and Philosophy](Project_Structure.md)
- [Local Development Guide](Production_Guide.md)
- [Gunicorn Deployment Guide](Project_Structure.md)

## Contributing

We welcome contributions to the GigYeah AI Engine! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests to us.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

- ChatGPT
- Inspiration - From Enterprise Projects at Office


