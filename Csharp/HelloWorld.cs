
// first step figuring out how to compile and run

// using System; // informs it to use the host Console
// Console.WriteLine("Hello World!");
// Console.WriteLine("It seems I need to know C# to help with PowerShell");
// Console.WriteLine("Who new /shrugs");



// Next figure out how to pull information from standard input
using System;
using System.IO; // informs it to use the host console

        TextReader textIn = Console.In;
        TextWriter textOut = Console.Out;

        textOut.WriteLine("Excuse me");
        textOut.Write("May I please get your name? ");
        String name = textIn.ReadLine();

        textOut.WriteLine("Ah, {0}!", name);
