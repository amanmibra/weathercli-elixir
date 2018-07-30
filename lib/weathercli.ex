defmodule WeatherCLI do
  use ExCLI.DSL, escript: true, mix_task: :sample
  require API

 name "weathercli"
 description "CLI to tell you the weather"
 long_description """
 This is my long description
 """

 option :verbose,
   help: "Increase the verbosity level",
   aliases: [:v],
   count: true

 command :hello do
   aliases [:hi]
   description "Greets the user"
   long_description """
   Gives a nice a warm greeting to whoever would listen
   """

   argument :name
   option :from, help: "the sender of hello"

   run context do
     if context.verbose >= 1 do
       IO.puts("I am going to emit a greeting.")
     end
     if from = context[:from] do
       IO.write("#{from} says: ")
     end
     IO.puts("Hello #{context.name}!")
    end
 end

 command :currently do
   aliases [:c]
   description "Displays current weather for set zipcode"

   argument :zip, [type: :string, default: 27529, metavar: :zipcode]

   run context do
     IO.inspect(context)
     zip = context[:zip]
     # if String.length(zip) !== 5 do
     #   raise "Error: Please input a valid zipcode with 5 characters."
     # end
     IO.puts "Running API:"
     API.currently zip
   end
 end

 command :forecast do

 end
end
