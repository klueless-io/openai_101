DAVID: Check this out, should add it into the openAI course:

https://www.loom.com/share/117eb552f1974f3d8e28463e9f1809e1

Based on:

https://innovate-aiml-data-apj.virtual.awsevents.com/media/10.%20Codenator%3A%20Enhancing%20user%20productivity%20through%20AI-powered%20code%20generation%20and%20secure%20execution/1_0kzrwmxu/330865472



# Openai 101

> OpenAI 101 Series on using OpenAI ChatGPT, DALL·E, and other OpenAI endpoints

**Focus Story**

As a software developer, I want to understand OpenAI endpoints and capabilities, so that I can use ChatGPT effectively



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'openai_101'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install openai_101
```

## JavaScript Dependencies Installation

This optional step is only required if you plan to use the JavaScript tools included in this gem from the command line.

[Javascript Tools]

This gem includes tools written in JavaScript, requiring Node.js and associated packages. After installing the gem, navigate to the gem's root directory and run:

```bash
npm install
```

## Resources

- [Course Outline](./COURSE.md)
- [OpenAI Documentation](gpt-context/openai-documentation.md) is used as reference material for code generation prompts, this information has been summarized from source documentation
- [Ruby OpenAI Documentation](gpt-context/ruby-openai-documenation.md) is used as reference material for code generation prompts and shows examples of how to use the Ruby OpenAI gem


See all [stories](./STORIES.md)

## Development

Checkout the repo

```bash
git clone https://github.com/klueless-io/openai_101
```

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. 

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Command line tools

### Bulk MidJourney Image Generation

Automates MidJourney prompts on Discord.

`automate-images-midjourney`

This tool will read prompts from a file and then paste them into the MidJourney Discord channel in an unattented manner. This is useful for automating the process of generating images from prompts in bulk. NOTE: You start the script and then you place the cursor in the Discord channel and the script will do the rest.

### Bulk ChatGPT Image Generation

Automates image prompts in ChatGPT.

`automate-images-chatgpt`

This tool will read prompts from a file and then paste them into the current focused ChatGPT window in unattented mode. This is useful for automating the process of generating images from prompts in bulk using the DALE-3 feature in ChatGPT Plus. NOTE: You start the script and then you place the cursor in the ChatGPT window and the script will do the rest.

### WEBP to PNG Converter:

Converts WEBP images to PNG, manages prompts.

`web3_to_png`

### EDL to Chapters

Converts EDL time codes to chapters in YouTube video description.

`edl_to_chapters`

Usage on Mac
```bash
# make the script executable
chmod +x bin/convert_webp_to_png.rb

# run the script
./bin/convert_webp_to_png.rb -s path/to/source -t path/to/target -f target_filename -p optional_prefix

# Example
./bin/convert_webp_to_png.rb -p series-2  -f woman-grey-tabby-cat -s /Users/davidcruwys/Sync/smart-downloads/download-images
 -t /Volumes/Expansion/Sync/tube-channels/a-cast/cast-active/a35-automate-image-generation/assets
```

This tool automates the conversion of WEBP images to PNG format, stores associated prompts, manages source backups, and cleans up after processing.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/klueless-io/openai_101. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Openai 101 project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/klueless-io/openai_101/blob/master/CODE_OF_CONDUCT.md).

## Copyright

Copyright (c) David Cruwys. See [MIT License](LICENSE.txt) for further details.
