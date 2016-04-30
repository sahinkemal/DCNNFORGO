# DCNNFORGO
Deep Convolutional Neural Networks to Play Go

## Synopsis
In this project, the main aim is to obtain AI model that plays Go like professional human Go player. To achieve this aim deep convolutional neural networks are used in order to not use brute-force and seeks a stronger and more humanlike moves. These convolutional neural networks and other model elements, or functions are built-in functions of Knet.jl, https://github.com/denizyuret/Knet.jl,. The model is tested by the data provided http://u-go.net/gamerecords/ after this data is prepared to have valid representation for Knet.jl. This data mapping from .sgf to tensor(4d arrays) is my own product using Julia. I also use JLD.jl,https://github.com/JuliaLang/JLD.jl, to save and load my data for each model.

## Motivation

In this project, Deep Convolutional Neural Networks is an approach to play Go like human experts. Pattern recognition is novel method rather than MCTS algorithms evaluate positions. The merge of pattern recognition and Deep Convolutional Neural Networks provide strong move detection.  

## Tests
By using following command with one of the model, the model chosen by user will be trained and tested. 
include("/path/to/oneOftheModel.jl")
In order to use convolutional model, you must work on a gpu machine. Otherwise, the training and testing will not be available.  

## Contributors
Kemal Emrecan Şahin

## License
Koç University
