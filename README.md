# FPGA Channel Strip
>A real-time FPGA audio processing channel strip, implemented using SystemVerilog for the DE0-Nano-SoC. Developed by John Matson and Igor Gasovic-Varga for BCIT's ELEX 7660, taught by Robert Trost.

## Usage

## Progress
Objective | Description | Status
--------- | ----------- | ------
Analog to digital conversion | Samples analog input signal to be processed digitally by the FPGA. An external IC in this case. | In progress
Digital to analog conversion | Converts digital output data to an analog signal. An external IC in this case. | Up next
High pass filter | A digital filter with the ability to pass higher-frequency signal components with little change in amplitude and low group delay while attenuating lower frequency signal components. Provides ability to adjust corner frequency. | Complete
Low pass filter | A digital filter with the ability to pass lower-frequency signal components with little change in amplitude and low group delay while attenuating higher frequency signal components. Provides ability to adjust corner frequency. | Complete
Equalizer | Provides ability to amplify or attenuate certain parts of a signal in the frequency domain without having to completely attenuate the way a high or low pass filter would. | Backlog
Compressor | Provides ability to attenuate the loudest parts of a signal while leaving quieter parts of the signal untouched. A type of dynamic processing. | Backlog
Phase flip | Provides ability to invert the signal, effectively performing a 180° phase shift. Useful for aligning multiple signals in time, such as top and bottom mics on a snare drum, for example. | Complete
Mute | Provides ability to toggle the output on and off. | Complete
Output gain | Provides ability to amplify or attenuate the signal before output. | Complete
Metering | Displays signal amplitude visually. For our purposes we display the difference in signal amplitude between output and input to channel strip. | Complete

## Contents
* [Executive Summary](#executive-summary)
* [Background](#background)
* [Technical Approach](#technical-approach)
* [Implementation](#implementation)
* [Conclusions & Future Work](#conclusions--future-work)

## Executive Summary
The design of audio processing systems which are suited to operate in live sound environments requires very low operational latency. FPGA chips are one of the best ways to meet this requirement. We were tasked with the completion of a self-directed project which applies the concepts covered in ELEX 7660 and chose to design an audio processing system capable of performing digital audio processing in real time. The product we set out to create was a single-channel audio processor with analog to digital conversion, several stages of processing, and a digital to analog conversion.

The final design includes modules for sine wave generation, low and high pass filtering, output gain control, muting, phase inversion, metering, and several other modules used to for the control of keypad and LED peripherals. One of the main advantages of the project is its ability to serve as a scalable platform. Once written, further stages of processing can easily be slotted in as desired, and – given the way in which FPGAs are well suited for parallel processing – additional channels could be added in parallel provided sufficient FPGA resources are available.

## Background
Behind the scenes of every concert and theatrical production is an intricate audio system most people take for granted. To emulate the sound of artists’ album recordings and create a meaningful experience for those in attendance, this audio system involves complex signal processing which is done using a live audio console. In broad terms, these consoles control signal flow and implement summing, filtering, and various types of dynamics processing, while processing effects, among other things. These consoles are organized by channel, each of which containing a number of user-controlled processing tools.

In the world of live audio, signal processing speed is essential. For this reason – although used to process audio in time-independent “studio” applications – software, especially software running on non-real-time operating systems (Windows, MacOS, Linux) is ill-suited for time-critical live audio processing. In industry, three solutions are common: analog circuitry, digital signal processors (DSPs), and field-programmable gate arrays (FPGAs). Analog circuitry – although beloved – has become largely obsolete due to its physical size, processing limitations, component fragility, etc. DSPs are very common in industry as they have the advantage of rapid signal processing, however they execute commands in serial – much like traditional processors – so scaling DSP based systems is costly because it requires multiple DSP units. Conversely, FPGAs are able to execute many parallel processes on a single chip which makes them an excellent choice for real-time audio processing.

Adaptating this idea for our project, we receive an audio signal as an input and sample it through the analog to digital converter (ADC). This digital signal is then transferred to the FPGA, where it is processed digitally before being sent through a digital to analog converter (DAC) and output to an audio jack.

## Technical Approach
Broadly speaking, we designed our system architecture by followed best practices for audio processing. Audio enters the system through an external audio-quality ADC. From there, audio is passed through a number of modules in sequence; a process known as signal flow. Each of these modules has several adjustable parameters, like the corner frequency of a filter for example. The ability to modify these parameters in real time allows for the device operator to hear the effects of different types of processing and adjust as needed. Finally, once the signal has passed through all stages of processing, the output level is metered and sent to the DAC.

In our design process, many of our specific decisions were made with audio quality in mind. Every digital signal processing application has a specified sampling rate and bit depth. Recording-caliber audio equipment typically employs a bit depth of at least 16. 24-bit systems are also common, but in the interest of conserving FPGA resources while maintaining professional-grade quality, we opted for 16-bit quantization, which provides a signal-to-noise ratio of 96dB.

The choice of sampling rate determines the frequency range that is captured with integrity. The human ear can hear frequencies as high as 20 kHz, and the Nyquist Theorem states that the sampling rate must be greater or equal to twice the highest frequency that is to be sampled – 40 kHz, in this case. Common professional-grade audio sampling frequencies are 44.1 kHz, 48 kHz, and 96 kHz. Higher sample rates do have a marginal effect on audio quality in capturing transitions with significant resolution. We opted for a sample rate of 48 kHz.

Another important design decision is the choice of filters. Digital filters are classified as either finite impulse response (FIR) or infinite impulse response (IIR). FIR filters have the advantage of linear phase and unconditional stability. On the other hand, IIR filters provide much better roll-off for the same number of taps. We specified a minimum roll off of 40 dB/decade which is achieved with a simple second order IIR filter, while the FIR equivalent requires far more taps for FIR and is actually not achievable at lower frequencies. The number of required taps is an important consideration when designing for FPGA, as each additional tap uses significant resources, which can really add up when considering a 16-bit system and for this reason, we opted for second order Butterworth IIR filters. The lack of linear phase is not ideal for an audio system, but fortunately the group delay in the passband is very low with the Butterworth filter topology.

## Implementation
### System Overview

## Conclusions & Future Work
