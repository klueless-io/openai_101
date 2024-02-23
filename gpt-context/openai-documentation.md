> OpenAI documentation compressed version `9th Feb, 2024`, this information is used to fact check and compare the OpenAI API implementation vs the ruby-openai implementation.

# Open AI Documentation

## GET STARTED

### [Introduction](https://platform.openai.com/docs/introduction)

#### OpenAI Platform Overview

The OpenAI Platform offers a versatile API suitable for a wide range of tasks, with various models available at different capabilities and price points, including custom model fine-tuning. Key highlights:

- **Data Privacy:** OpenAI prioritizes user data protection, ensuring that model training does not include data passed through the API.

- **Text Generation Models (GPT):** GPT models like GPT-4 and GPT-3.5 are designed for understanding and generating natural and formal language text. They can be applied to tasks such as content creation, summarization, conversation, and more. Users interact with these models via "prompts," which guide the models on task completion.

- **Assistants:** Powered by models like GPT-4, assistants perform tasks based on instructions within their context window. They can access additional tools for tasks like running code or file retrieval.

- **Embeddings:** OpenAI provides text embedding models that generate vector representations of text, useful for search, clustering, recommendations, and more.

- **Tokens:** Text processing is handled in "tokens," representing sequences of characters or words, essential for understanding model input and output limits.

- **Guides and Tutorials:** OpenAI offers comprehensive guides on using the platform, including tutorials on text generation, building assistants, using embeddings, speech-to-text, image generation, and processing images with GPT-4.

This summary encapsulates the core offerings and functionalities of the OpenAI Platform, focusing on its application in text generation, assistant development, and embeddings, along with the importance of data privacy and the practical aspects of interacting with these models.

### [Quickstart](https://platform.openai.com/docs/quickstart?context=python)

#### OpenAI API Quickstart Guide Summary

The OpenAI API offers developers an interface to integrate OpenAI's models into their applications, notably through the Chat Completions endpoint powered by models like GPT-4. This guide aims to help developers set up their environment and make their first API request efficiently.

##### Key Steps:

1. **Account Setup**: Create or sign into an OpenAI account and generate a new secret API key on the API key page.
   
2. **Development Environment**: Ensure Python is installed (version 3.7.1 or newer is required). Test Python installation via Terminal (MacOS) or Command Prompt (Windows). If not installed, download Python from the official website.

3. **Virtual Environment** (Optional): Use Python's `venv` module to create a virtual environment for a clean workspace. This step helps avoid library conflicts between projects.

4. **OpenAI Python Library Installation**: Install the OpenAI Python library using `pip`. This library simplifies working with the OpenAI API in Python applications.

5. **API Key Configuration**:
   - **For all projects**: Configure the API key as an environment variable (using `.bash_profile` or `.zshrc` for MacOS and `setx` command or system properties for Windows).
   - **For a single project**: Use a local `.env` file within the project directory, ensuring it is ignored by version control with `.gitignore`.

6. **First API Request**: With the environment and API key configured, the guide provides a Python code snippet to send a request to the OpenAI API. This involves creating a script (e.g., `openai-test.py`) and running it to perform a task, such as generating text with a specific model.

##### Additional Resources:

- **API Reference and GPT Guide**: For developers seeking deeper insights or advanced functionalities of the OpenAI API.
- **OpenAI Cookbook**: Offers in-depth examples and code snippets for common API use cases.
- **Example Prompts and Playground**: Explore the capabilities of OpenAI's models or experiment with the API without coding.

This summary encapsulates the initial steps for developers to get started with the OpenAI API, covering environment setup, Python library installation, API key configuration, and making the first API request. Additional resources are provided for further exploration and advanced usage.


### [Models](https://platform.openai.com/docs/models)

#### OpenAI API Models Overview

The OpenAI API encompasses a range of models designed for various tasks, including natural language processing, image generation, text-to-speech, and more. These models are available at different capabilities and price points, with options for customization through fine-tuning.

##### Key Models and Features:

- **GPT-4 and GPT-4 Turbo**: Advanced models for generating and understanding natural language or code, improving upon GPT-3.5 with broader general knowledge and reasoning capabilities.
- **GPT-3.5 Turbo**: Enhanced version of GPT-3.5 optimized for both chat and traditional completion tasks.
- **DALL·E**: Capable of generating and editing images from natural language descriptions.
- **TTS (Text-to-Speech)**: Converts text into natural-sounding audio, with variations optimized for speed or quality.
- **Whisper**: Audio-to-text model for general-purpose speech recognition, supporting multilingual recognition, translation, and language identification.
- **Embeddings**: Converts text into numerical vectors, facilitating tasks like search, clustering, and classification.
- **Moderation**: Detects sensitive or unsafe text content, aiding in compliance with OpenAI's usage policies.

##### GPT-4 Model Variants:

- **GPT-4 Turbo (gpt-4-0125-preview)**: Newest GPT-4 model designed to reduce "laziness" in task completion, supporting up to 128,000 tokens.
- **GPT-4 Turbo (gpt-4-1106-preview)**: Features improved instruction following, JSON mode, and reproducible outputs, but not yet recommended for production.
- **GPT-4 Vision (gpt-4-vision-preview)**: Integrates image understanding capabilities with GPT-4 Turbo's features, supporting up to 128,000 tokens.

##### GPT-3.5 Turbo Updates:

- **Updated GPT-3.5 Turbo (gpt-3.5-turbo-0125)**: Latest model with higher accuracy and a fix for non-English text encoding issues, supporting up to 16,385 tokens.

##### DALL·E Variants:

- **DALL·E 3**: Latest iteration capable of generating new images or editing provided ones based on natural language prompts.
- **DALL·E 2**: Offers improvements over the original model with higher resolution and accuracy.

##### Data Policy:

- OpenAI commits to not using data sent through the API for model training without explicit opt-in from users.
- Offers options for zero data retention for trusted customers with sensitive applications, ensuring enhanced privacy.

##### Deprecated Models:

- OpenAI maintains a list of deprecated models with suggested replacements, encouraging developers to migrate to newer versions for improved performance and features.

This summary highlights the diverse set of OpenAI API models tailored for different AI-driven tasks, their unique capabilities, and OpenAI's commitment to user data privacy.


### [Tutorials](https://platform.openai.com/docs/tutorials)


### [Changelog](https://platform.openai.com/docs/changelog)


## CAPABILITIES

### Text generation

#### OpenAI Text Generation Models Analysis

OpenAI's text generation models, known as generative pre-trained transformers (GPTs) or large language models, are trained to comprehend and generate text based on natural language, code, and images. The core interaction with these models is through "prompts," which serve as instructions or examples for the model to follow, effectively "programming" the model to perform a specific task.

##### Applications of Text Generation Models:
- **Document Drafting**: Automate the creation of written content.
- **Code Writing**: Generate computer programming code.
- **Knowledge Base Querying**: Answer questions using a vast database of information.
- **Text Analysis**: Understand and interpret texts.
- **Natural Language Interfaces**: Communicate with software in everyday language.
- **Tutoring**: Educate on various subjects through interactive engagement.
- **Language Translation**: Convert text from one language to another.
- **Character Simulation for Games**: Create dynamic and responsive game characters.
- **Image Processing and Understanding**: With gpt-4-vision-preview, these models now also comprehend and process images.

##### Model Access and Use:
To utilize these models, users send a request with their inputs and API key to the OpenAI API, receiving text outputs in response. The primary API endpoint for the newest models, including 

#### OpenAI Platform Overview

OpenAI's text generation models, also known as generative pre-trained transformers (GPTs) or large language models, are trained to comprehend and generate text based on natural language, code, and images. These models operate on inputs referred to as "prompts," which guide the model in performing specific tasks, akin to programming a large language model.

##### Applications of GPT Models
- **Document Drafting**: Automate the creation of text documents.
- **Code Writing**: Generate programming code.
- **Knowledge Base Queries**: Answer questions using comprehensive databases.
- **Text Analysis**: Understand and interpret textual content.
- **Natural Language Interfaces**: Enhance software with user-friendly language interactions.
- **Tutoring**: Offer educational support across various subjects.
- **Language Translation**: Convert text from one language to another.
- **Character Simulation**: Create dynamic characters for gaming applications.
- **Image Processing and Understanding**: With the advent of gpt-4-vision-preview, these models can now also interpret and process images.

##### Utilizing the Models
To interact with these models, users submit a request via the OpenAI API containing their input along with their API key. Responses from the model are based on the latest versions, such as gpt-4 and gpt-3.5-turbo, accessible through the chat completions API endpoint.

##### Chat Completions API
This API endpoint processes a sequence of messages as input and generates a model-based message as a response. It is designed to facilitate both extensive, multi-turn conversations and simple, direct queries.

##### Experimentation and Selection
OpenAI provides a playground for experimenting with various models, recommending gpt-3.5-turbo or gpt-4-turbo-preview for those uncertain about which model best suits their needs. This flexibility and support aim to enhance application performance through tailored model interaction, including:

- **Prompt Engineering**: Strategies to optimize model performance by crafting effective prompts.
- **Model Fine-Tuning**: Customizing models for specific tasks to improve accuracy and relevance.
- **Data Retention and Privacy**: Adhering to policies that respect user privacy and data usage.

##### Conclusion
OpenAI's text generation models offer a wide array of applications, from enhancing document creation to providing insights into complex datasets. With the introduction of capabilities like image processing, these models continue to expand the possibilities for developers and businesses alike.



### Function calling

#### Connecting Large Language Models to External Tools

OpenAI's advancements in large language models enable the integration with external tools through the Chat Completions API, where models can intelligently output JSON objects. These objects contain arguments for calling external functions based on the input provided, enhancing the models' interactivity and utility.

##### Key Features:
- **Function Calling**: Models like gpt-3.5-turbo-0125 and gpt-4-turbo-preview have enhanced capabilities to detect when and which functions to call, responding with JSON formatted according to the function signature.
- **User Confirmation Flows**: It's advised to implement confirmation steps before executing actions based on model outputs, ensuring actions like sending emails or making online posts are intended by the user.
- **Structured Data Retrieval**: Function calling enables models to return structured data, making it easier to:
  - Answer questions by calling external APIs.
  - Convert natural language into API calls.
  - Extract structured data from text.

##### Function Calling Process:
1. **Initial Call**: The model is called with a user query and defined functions.
2. **Model Response**: If function calling is chosen, the output is a JSON object matching the custom schema.
3. **Function Execution**: The JSON is parsed, and the function is called with the provided arguments.
4. **Response Integration**: The function's response is added as a new message, allowing the model to summarize or proceed based on the results.

##### Supported Models:
Function calling and parallel function calls are supported by specific models, including various versions of GPT-4 and GPT-3.5 Turbo.

##### Parallel Function Calls:
This feature allows multiple functions to be called simultaneously, useful for time-consuming operations or when multiple pieces of data are needed concurrently.

##### Customizing Function Calls:
- **Specific Function Invocation**: By setting `tool_choice` with a function name, you can direct the model to call a particular function.
- **Forcing User-Facing Messages**: Setting `tool_choice` to "none" prompts the model to generate a direct response to the user.

##### Practical Application Example:
An example provided demonstrates invoking the `get_current_weather` function for multiple locations, showcasing how to handle multiple function calls and integrate their responses for a comprehensive user reply.

##### Further Learning and Examples:
The OpenAI Cookbook offers additional examples and guidelines for function calling, aiding developers in effectively utilizing this feature for various applications.

##### Considerations:
- **Function Limitations**: Functions are part of the system message, affecting the model's context limit and token billing.
- **Fine-Tuning for Efficiency**: Reducing token usage through fine-tuning can optimize function calling, especially when numerous functions are defined.

This guide emphasizes the potential of large language models to interact with external tools, outlining the process and considerations for implementing function calling within applications.


### Embeddings

#### Transforming Text into Numbers with OpenAI Embeddings

OpenAI introduces new embedding models, **text-embedding-3-small** and **text-embedding-3-large**, which are designed to convert text into numerical vectors, enabling a myriad of use cases such as search, clustering, recommendations, anomaly detection, diversity measurement, and classification. These embeddings measure the relatedness of text strings, where the distance between vectors indicates their similarity.

##### Key Applications of Text Embeddings:
- **Search**: Rank results by relevance to a query string.
- **Clustering**: Group text strings by similarity.
- **Recommendations**: Suggest items related to given text strings.
- **Anomaly Detection**: Identify outliers with little relatedness to the main dataset.
- **Diversity Measurement**: Analyze the distribution of similarity within a dataset.
- **Classification**: Categorize text strings by their closest label.

##### Features of the New Models:
- **Performance**: Offer higher multilingual performance and efficiency at lower costs.
- **Flexibility**: New parameters control the overall size, with **text-embedding-3-small** producing a vector length of 1536 and **text-embedding-3-large** extending to 3072 dimensions.

##### Generating Embeddings:
To generate an embedding, send a text string to the embeddings API endpoint along with the chosen model ID. The response includes a vector representing the text, which can be utilized across various applications by saving it in a vector database for future use.

##### Use Cases Demonstrated:
- **Creating assistants** that leverage external APIs for answering queries.
- **Converting natural language** into API calls for streamlined operations.
- **Extracting structured data** from unstructured text to gain insights.

##### Embedding Model Generations:
OpenAI offers two third-generation embedding models, detailed in the embedding v3 announcement blog post, highlighting improvements over previous generations regarding tokenization and input capacity, with a knowledge cutoff in September 2021.

##### Pricing and Efficiency:
Pricing for the embedding models is based on the number of input tokens. The models are designed to be cost-effective, offering a balance between performance and expense, making them accessible for various scales of use, from small projects to large-scale applications.

##### Practical Examples and Applications:
This overview touches on practical examples such as:
- **Answering questions** by embedding additional information into the model's context window.
- **Text search** using embeddings to retrieve the most relevant documents based on cosine similarity.
- **Code search** by indexing Python functions and performing searches with natural language queries.
- **Recommendations** using embeddings to suggest similar items or content.
- **Visualization** of embeddings in 2D using the t-SNE algorithm to uncover patterns in data.
- **Regression and classification** with embeddings as features in machine learning algorithms.
- **Zero-shot classification** without labeled training data by comparing embeddings of new text to class embeddings.

##### Recommendations and Best Practices:
For efficient searching over large sets of vectors, the use of a vector database is recommended. OpenAI suggests cosine similarity as the distance function due to embeddings being normalized, making computations slightly faster and rankings identical between cosine similarity and Euclidean distance.

##### Ownership and Knowledge Limitations:
Customers retain ownership of their input and output data, including embeddings. However, it's crucial to note that the **text-embedding-3-large** and **text-embedding-3-small** models reflect knowledge only up to September 2021, potentially affecting performance in edge cases related to more recent events.

This analysis highlights the capabilities and applications of OpenAI's embedding models, demonstrating how they can transform text into actionable, numerical data to power a wide range of AI-driven solutions.


### Fine-tuning

## Customizing Models through Fine-Tuning

Fine-tuning enhances OpenAI's models for specific applications, providing numerous advantages over standard prompting techniques:

#### Key Advantages
- **Enhanced Quality**: Yields better results than basic prompting.
- **Efficient Training**: Trains on more examples than prompt capacity allows.
- **Token Economy**: Reduces prompt length, saving tokens.
- **Speed**: Offers lower latency for requests.

#### Fine-Tuning Steps
1. **Data Preparation**: Upload your tailored training data.
2. **Model Training**: Develop a new model based on this data.
3. **Evaluation**: Assess performance and iterate as needed.
4. **Implementation**: Deploy your fine-tuned model.

#### Available Models for Fine-Tuning
Support includes models like gpt-3.5-turbo-1106, with gpt-4-0613 in experimental access. Fine-tuning not only refines models but also allows for iterative improvements with additional data.

#### Considerations Before Fine-Tuning
- **Prompt Engineering**: Often, refining prompts or using prompt chaining can significantly improve output without the need for fine-tuning.
- **Function Calling**: Leveraging this feature might provide the necessary enhancement.

#### Fine-Tuning Use Cases
- **Style and Tone Adjustments**: Tailor these aspects to fit specific needs.
- **Reliability Improvement**: Enhance the model's output consistency.
- **Complex Prompt Handling**: Simplify the model's response to complex instructions.
- **Edge Case Management**: Fine-tune the model to handle unique scenarios.
- **Skill Acquisition**: Teach the model new tasks or information.

#### Implementing Fine-Tuning
- **Training Format**: Use the Chat Completions API format for conversations in your training data.
- **Example Volume**: Starting with 50 to 100 examples often yields noticeable improvements.

#### Cost Considerations
Fine-tuning is billed based on the number of tokens used during training and usage. Pricing details are available on OpenAI's website.

#### Post-Fine-Tuning Evaluation
After fine-tuning, models are immediately available for inference. Performance should be evaluated using a test set to ensure the training has achieved its goals.

#### Hyperparameter Tuning
OpenAI supports adjustments to epochs, learning rates, and batch sizes for fine-tuning, with default settings recommended for initial training.

#### Conclusion
Fine-tuning offers a path to customize OpenAI's powerful models to meet specific needs, enhancing both performance and operational efficiency.


### Image generation

The OpenAI Images API offers three main features for working with images: creating new images, editing existing images, and generating variations of an image, all based on text prompts. Here's a breakdown of how each feature works:

1. **Creating Images from Scratch**: You can generate original images using DALL·E 3 and DALL·E 2 by providing a text prompt. DALL·E 3 supports generating images in sizes of 1024x1024, 1024x1792, or 1792x1024 pixels, with an option for HD quality. You can request one image at a time with DALL·E 3 or up to 10 images at once with DALL·E 2.

2. **Editing Existing Images**: Also known as "inpainting", this feature lets you modify specific areas of an image by uploading the original image and a mask. The transparent areas of the mask define where edits should be made based on a new text prompt. This feature is available with DALL·E 2 only.

3. **Generating Variations of an Image**: This endpoint generates variations of a given image, allowing for creative exploration of a theme or concept. Like image editing, this feature is exclusive to DALL·E 2.

Additionally, the API includes error handling for issues like invalid inputs and rate limits, with responses that can include both URLs and Base64 data for the generated images. Node.js examples provided in the documentation demonstrate how to handle image data, both from disk and in-memory, to make API calls effectively.


### Vision

GPT-4 with Vision, known as GPT-4V or gpt-4-vision-preview, introduces the capability for models to understand images in addition to text. This advancement expands the potential applications of GPT-4, making it suitable for tasks that involve visual data. Here are the key points:

- GPT-4 with Vision is accessible to developers with access to GPT-4 through the gpt-4-vision-preview model and the Chat Completions API, which now supports image inputs.
- The model can interpret images by either directly receiving a link to the image or processing a base64 encoded image included in the request.
- It's designed to answer general questions about images, understanding the content and context, but it has limitations, especially regarding detailed spatial reasoning or interpreting specialized content like medical images.
- Images can be passed in various message roles (user, system, assistant), with certain restrictions, such as not supporting images in the first system message.
- The model processes images at different detail levels, controlled by the "detail" parameter, affecting response speed, token consumption, and the detail of the image understanding.
- Images are resized and processed without retaining original metadata, and are deleted after processing, aligning with privacy considerations.
- The system blocks the submission of CAPTCHAs for safety reasons and limits the types of supported image formats to PNG, JPEG, WEBP, and non-animated GIFs, with a maximum size limit of 20MB per image.
- Image processing contributes to the overall token consumption, with costs calculated based on the image size and detail level.
- Despite its capabilities, the model has its limitations, such as not being optimized for non-Latin alphabets, struggling with small text, and specific spatial tasks.


### Text-to-speech

The Audio API offers a TTS (text-to-speech) model enabling text conversion into spoken audio with six different voices. It's designed for various applications, including narrating blog posts, producing audio in multiple languages, and supporting real-time audio output through streaming. Key aspects include:

- **Voice Options**: Alloy, Echo, Fable, Onyx, Nova, Shimmer, optimized primarily for English but capable of multiple languages.
- **Output Formats**: Supports MP3, OPUS, AAC, and FLAC formats catering to diverse needs like streaming, digital audio compression, and lossless audio quality.
- **Language Support**: Compatible with numerous languages, closely following the Whisper model's language capabilities.
- **Real-Time Streaming**: Allows for audio streaming, enabling playback before the entire file generation.
- **Emotional Output Control**: There's no direct method to influence the emotional tone of the generated audio.

Usage notes emphasize the importance of disclosing the AI-generated nature of the audio to end users, aligning with ethical guidelines and transparency.


### Speech-to-text

The Audio API features speech-to-text capabilities via transcriptions and translations, utilizing the Whisper model. Key functionalities include:

- **Transcription**: Converts audio to text in the original language.
- **Translation**: Transcribes and translates audio to English.
- **File Support**: Accepts files up to 25 MB in formats like mp3, mp4, mpeg, mpga, m4a, wav, and webm.

A basic transcription request returns JSON with the transcribed text. The API supports various parameters for customization, including output file formats.

Translations transcribe audio from supported languages into English. The service covers a broad range of languages, focusing on those with a word error rate (WER) below 50%.

For files exceeding 25 MB, segmentation is recommended, avoiding mid-sentence splits to maintain context. Tools like PyDub can assist in segmenting audio files.

Prompting can enhance transcription accuracy, especially for specific words or acronyms. Whisper's model may also adapt to prompts' styles for punctuation and filler words. However, it's limited to the first 244 tokens of a prompt and uses its custom tokenizer for multilingual inputs or GPT-2's tokenizer for English-only inputs.

To address challenges in recognizing uncommon terms, post-processing with GPT-4 or GPT-3.5-Turbo is suggested, leveraging GPT-4's broader context window for scalable and reliable corrections.


### Moderation

The Moderations API enables developers to ensure their content adheres to OpenAI's usage policies by classifying content into specific categories. It helps identify prohibited content, such as hate speech, harassment, self-harm, sexual content, and violence, including more specific subcategories like threats or graphic violence. This tool is crucial for filtering out harmful content and is free for monitoring inputs and outputs of OpenAI's APIs. However, its use is restricted to this purpose, and accuracy might decrease for longer texts, suggesting a strategy of breaking down larger texts into smaller segments for better performance.


## ASSISTANTS

### Overview

The Assistants API enables the creation of AI assistants capable of responding to user queries through models, tools, and knowledge. It supports Code Interpreter, Retrieval, and Function calling tools, with more on the way. The typical workflow involves creating an Assistant with custom instructions and a chosen model, initiating a Thread for user conversations, adding Messages as queries, and executing the Assistant to generate responses, automatically invoking necessary tools. The API, currently in beta, aims to simplify integration and manage conversation contexts efficiently, offering a playground for exploration and a streamlined process for building AI-driven interactive experiences.


### How Assistants work


The Assistants API facilitates the development of AI assistants, offering capabilities such as model invocation with specific instructions, access to various tools (Code Interpreter, Knowledge Retrieval, Function Calling), and management of conversation threads for persistent user interactions. It allows the use of files in interactions and supports a range of customization options for tailoring assistant behavior, including instructions and tool access. Key concepts include Assistants for defining AI behavior, Threads for managing conversations, Messages for communication within threads, and Runs for processing user queries with Assistants. The API, currently in beta, is designed for flexibility and ease of integration, encouraging feedback from developers to enhance its features.


### Tools

The Assistants API enables the integration of OpenAI-hosted tools like Code Interpreter and Knowledge Retrieval into AI assistants, providing capabilities such as running Python code in a sandbox environment and accessing external knowledge. It supports file processing and generation, and allows customization of assistant behavior through specific instructions and tool access. Additionally, the API is designed to facilitate function calling for dynamic response generation. With an emphasis on versatility and user-defined functionality, the Assistants API caters to a wide range of applications, from customer support to educational tutoring, by leveraging advanced AI models and computational resources. Usage of OpenAI-hosted tools incurs additional fees, and the API is currently in beta, with OpenAI seeking community feedback for further development.


## GUIDES

This guide outlines strategies for optimizing results from large language models like GPT-4. It emphasizes the importance of clear and specific prompts, breaking down complex tasks, and utilizing "chain of thought" reasoning for improved accuracy. Additionally, it suggests offloading certain tasks to specialized tools, like text retrieval systems or code execution engines, for tasks beyond the model's capabilities. 

Key strategies include:

- **Providing Context**: Be explicit in your prompts to reduce ambiguity.
- **Decomposing Tasks**: Break complex tasks into simpler, manageable parts.
- **Chain of Thought**: Encourage the model to detail its reasoning process.
- **Leveraging Tools**: Use external tools for tasks like code execution or document retrieval.
- **Measuring Performance**: Establish a comprehensive test suite to accurately evaluate changes.

Examples and tactics provided aim to enhance interaction with GPT models, from specifying the format and detail level of responses to enriching inputs with external knowledge. Tactics also cover how to guide models through reasoning tasks, improve dialogue continuity, and summarize extensive content. 

Furthermore, the guide discusses:

- **Model Limitations**: Understanding and compensating for these through structured inputs and leveraging external resources.
- **Efficient Knowledge Retrieval**: Using embeddings for dynamic information lookup.
- **Execution of Generated Code**: Safely running code to perform calculations or API calls.
- **Evaluation Procedures**: Designing evals to measure system performance comprehensively.

For practical application, the guide suggests experimenting with the presented methods and encourages feedback for continuous improvement.

### Prompt engineering


This guide provides strategies for optimizing the use of GPT-4, encouraging experimentation to discover effective tactics. It highlights the importance of clarity in prompts, breaking down complex tasks, incorporating a "chain of thought," utilizing external tools for enhanced accuracy, and measuring performance improvements through comprehensive testing.

Key Strategies:
- Providing detailed prompts and context enhances model output relevance and accuracy.
- Decomposing complex tasks into simpler components reduces error rates and improves outcomes.
- Encouraging the model to reason through problems step-by-step ("chain of thought") leads to more reliable answers.
- Leveraging external tools (e.g., retrieval systems, code execution engines) compensates for the model's limitations, enabling it to handle a broader range of tasks effectively.
- Measuring performance with a comprehensive test suite ensures that modifications lead to genuine improvements.

Tactics for Implementation:
- Use explicit instructions and examples to guide the model's output, improving the quality and relevance of responses.
- Apply step-by-step instructions for complex tasks to simplify the model's processing and increase accuracy.
- Employ "inner monologue" techniques to hide detailed reasoning from the user while ensuring accurate problem-solving by the model.
- Integrate knowledge retrieval and code execution within prompts to enable the model to access and utilize external information and computational capabilities.

The guide emphasizes the potential of GPT-4 when properly guided and the value of structured approaches to task presentation and problem-solving. It also points to the OpenAI Cookbook for practical examples and further exploration.


### Production best practices

This guide outlines best practices for transitioning from a prototype to a production environment with OpenAI's API, covering aspects from securing API access to designing a robust architecture capable of handling high traffic volumes.

Key Takeaways:
- Secure your OpenAI API access, understanding your organization's name and ID, managing user roles, and ensuring API keys' safety.
- Set up billing information to make API requests, with an initial $100 monthly usage limit automatically adjusted based on platform use.
- Utilize usage notifications and budgets to manage costs effectively, avoiding unexpected charges.
- Consider both horizontal and vertical scaling strategies to accommodate traffic demands, alongside caching and load balancing to optimize performance.
- Address latency in API requests by selecting appropriate models, managing token generation, optimizing request geography, batching prompts, and streaming responses.
- Monitor and manage costs by understanding the pay-as-you-go pricing model, estimating token utilization, and exploring cost reduction strategies through model selection and operational efficiencies.
- Develop an MLOps strategy to manage the lifecycle of machine learning models, including data management, model monitoring, retraining, and deployment.
- Assess and address security and compliance requirements relevant to your application, following best practices for data handling, privacy, and secure coding.
- Implement safety best practices to ensure your AI-powered application is secure and adheres to ethical standards.

The guide emphasizes the importance of meticulous planning, security measures, and operational strategies to ensure a smooth and efficient transition to production.

### Safety best practices

OpenAI's Moderation API provides a free tool to help mitigate the creation of unsafe content. For tailored needs, developing a custom content filtration system is recommended. Key strategies include:

- **Red-Teaming**: Test your application extensively across a broad range of inputs, including adversarial attempts to uncover vulnerabilities.
- **Human Review**: In high-stakes domains and for code generation, having a human review outputs is critical. Reviewers should understand the system's limitations and have access to source materials for verification.
- **Prompt Engineering**: Craft prompts carefully to guide the model towards producing the desired content, reducing the risk of generating unwanted material.
- **User Authentication**: Require users to register and log in, potentially linking to existing accounts (e.g., Gmail, LinkedIn) for added security. For higher security, consider requiring a credit card or ID card.
- **Input and Output Limitations**: Restrict the amount and type of user inputs and model outputs to prevent misuse. This includes limiting prompt lengths and output token amounts.
- **Validated Inputs and Outputs**: Use validated dropdown fields for inputs and restrict outputs to trusted sources to minimize risks.
- **Misuse Reporting**: Provide users with a straightforward way to report issues, ensuring these reports are monitored and addressed by humans.
- **Evaluating Model Fit**: Assess the model's suitability for your application, understanding its limitations, potential biases, and the spectrum of user inputs.
- **Safety and Security Reporting**: Report any API safety or security concerns through OpenAI's Coordinated Vulnerability Disclosure Program.
- **Monitoring for Abuse**: Include unique, anonymized end-user IDs in API requests to assist OpenAI in abuse detection and to receive actionable feedback for policy violations.

These practices aim to enhance the safety, security, and effectiveness of applications utilizing OpenAI's models in production environments.

### Rate limits

OpenAI imposes rate limits on API usage to prevent abuse, ensure fair access, and manage load on its infrastructure. These limits are based on requests per minute (RPM), requests per day (RPD), tokens per minute (TPM), tokens per day (TPD), and images per minute (IPM). Rate limits are set at the organization level, vary by model, and include usage limits to control spending.

Key Points:
- **Rate Limits**: Enforced to prevent API abuse/misuse, ensure equitable access, and manage server load.
- **Measurement**: Limits include RPM, RPD, TPM, TPD, and IPM.
- **Organization-Level Enforcement**: Limits apply at the organization level, not the user level.
- **Model Variance**: Different models have different rate limits.
- **Usage Tiers**: Organizations are automatically moved to higher usage tiers based on spending, which can increase rate limits.
- **Monitoring**: Rate and usage limits can be viewed in account settings, with rate limit details also provided in HTTP response headers.

Strategies for Managing Rate Limits:
- **Monitor Usage**: Regularly check your rate and usage limits.
- **Handle Rate Limit Errors**: Implement exponential backoff strategies to manage requests upon reaching rate limits.
- **Batch Requests**: To maximize throughput within rate limits, batch tasks into each request, particularly for models with lower per-minute limits.
- **Programmatic Access and Bulk Features**: Exercise caution, possibly limiting access to trusted customers to prevent automated misuse.
- **Usage Limit for Users**: Set a usage cap for individual users to protect against high-volume misuse.

Implementing Exponential Backoff:
- **Tenacity and Backoff Libraries**: Python libraries that simplify adding retry behavior with exponential backoff.
- **Manual Implementation**: Custom exponential backoff logic can be implemented without third-party libraries.

Batching Prompts:
- **Increased Throughput**: Batching multiple tasks into each request can help utilize available token capacity more efficiently.
- **Implementation**: The `prompt` parameter can accept a list of strings, allowing multiple tasks to be processed in a single API call.

Safety Recommendations:
- **Automated Retries**: Use automatic retries with exponential backoff to recover from rate limit errors without crashes or missing data.
- **Rate Limit Awareness**: Design your application to be aware of rate limits, potentially adjusting request patterns based on current usage and limits.

The guide underscores the importance of understanding and effectively managing rate limits to ensure a smooth operation of applications that utilize the OpenAI API, promoting efficient use and preventing potential disruptions.

