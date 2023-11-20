Links to Video :
https://www.youtube.com/@KenIntQ/videos

How to know the existing verbosity level ?
    $display("Default verbosity level : %0d",uvm_top.get_report_verbosity_level);

How to set  verbosity level ?
    uvm_top.set_report_verbosity_level(UVM_HIGH); //For setting UVM_HIGH

How to set verbosity level for specific IDs ?
    drv.set_report_id_verbosity("DRV1",UVM_HIGH);  //For setting verbosity level as UVM_HIGH for messages with ID DRV1

How to set verbosity level for specific uvm_components ?
    drv.set_report_verbosity_level(UVM_HIGH);     //For setting verbosity level as UVM_HIGH for component drv

What are other reporting macros ?
    uvm_warning ,uvm_error,uvm_fatal

How to override severity of info macros ?
    d.set_report_severity_override(UVM_FATAL,UVM_ERROR);   //Overrides UVM_FATAL to UVM_ERROR, d is instance of driver component

How to override severity of info macros with ID ?
    d.set_report_severity_id_override(UVM_FATAL,"DRV",UVM_ERROR);  //Overrides UVM_FATAL to UVM_ERROR for all messages with ID "DRV", d is instance of driver component

How to set_report_severity_action ?
    d.set_report_severity_action(UVM_INFO,UVM_DISPLAY|UVM_LOG|UVM_COUNT);  //This would set the severity action for uvm_info to display,log and increment count for each UVM_INFO

How to set max quit count for errors ?
    d.set_report_max_quit_count(3);

Entire UVM Environment is built from two clases 1) UVM_COMPONENT 2)UVM_OBJECT

What is the difference between UVM_COMPONENT and UVM_OBJECT ?
    UVM_COMPONENT has UVM_TREE and UVM_PHASES while UVM_OBJECT doesnt have them.


BASE CLASSES 
    1)UVM_OBJECT        1)UVM_TRANSACTION
                        2)UVM_SEQUENCE_ITEM
                        3)UVM_SEQUENCE
    
    2)UVM_COMPONENT     1)UVM_DRIVER
                        2)UVM_SEQUENCER
                        3)UVM_MONITOR
                        4)UVM_AGENT
                        5)UVM_SCOREBOARD
                        6)UVM_ENV
                        7)UVM_TEST   

What are the core methods of UVM_OBJECT ?
            1)Print
            2)record
            3)copy
            4)clone
            5)compare
            6)create
            7)pack+unpack

UVM_REPORTING 

Reporting Mechanisms in UVM

Overview: Reporting mechanisms are vital in the verification environment to convey information to the console.

UVM info: Used for informative messages, allowing control over message delivery with three arguments.

`uvm_info("DB top", "Hello World", UVM_LOW)

Redundancy Level: The redundancy level should be less than or equal to the default level (200).

Available Levels: Redundancy levels include none, low, medium, high, full, and debug.

UVM Warning, Error, and Fatal: UVM warning signals potential problems, UVM error for real problems, and UVM fatal for severe issues that halt simulation.

Behavior Overrides: Behavior can be customized using overrides



UVM_OBJECT
Base class in UVM.

UVM_COMPONENT is derived from UVM_OBJECT.
uvm_tree and uvm_phases are things special to uvm_component and not uvm_objects.
After registering class we get accesses to some methods like print.
Constructor of a class would look like
 //  Constructor: new
function new(string name = "mul_transaction");
    super.new(name);
endfunction: new


When fields in txnn are registered ,we need to use uvm_object_utils_begin and uvm_object_utils_end.
uvm_field_int(a,UVM_ALL_ON)  //FOR A FIELD a everything is enabled.
after the field is registered we get access to all the printer methods part of uvm .
so to change the printing format it could be something like.

o.print(uvm_default_tree_printer);

uvm_field_int(a,UVM_DEFAULT|UVM_BIN) 
uvm_field_int(b,UVM_DEFAULT|UVM_NOPRINT)

uvm_field_object -> for a instance of a class inside a class

uvm_field_enum -> For enums
typedef enum bit[1:0] {s0,s1,s2,s3} state_type
rand state_type state;
real temp =12.34;
string str="UVM";
parent p;

`uvm_object_utils_begin
   `uvm_field_enum(state_type,state,UVM_DEFAULT)
   `uvm_field_string(str,UVM_DEFAULT)
   `uvm_field_real(temp,UVM_DEFAULT
   `uvm_field_object(P,UVM_DEFAULT)
`uvm_object_utils_end

Packed Array - If dimensions of the array are written on LHS of the array name its a packed array and continous memory are assigned for all the elements. [7:0]a
Unpacked Array - If dimensions of the array are written on RHS of the array name its a unpacked array and continous memory are assigned for all the elements. a[7:0]

Macros for Array 
1) Static Dynamic   arr1[3]={1,2,3}
2) Dynamic Array    arr2[]  memory gets allocated when arr2=new()
3) Associative Array ,can be indexed by string or integer 
4) Queues

Two different types of copy in system verilog are 
1)Shallow Copy
2)Deep Copy

a=b; This means to be shallow copy which means that if there is a class which has "has a" relationship then that is not copied properly and if something is changed in a.f=20 then b.f will also change to 20 automatically since both point to one place.

Copy method 
If i want to copy something from a to b then use the copy method from uvm .
    b.copy(a)   //a would be copied to class b and it implements a deep copy.

Clone method.
This would create and copy ,always use $cast when using clone method
    $cast(b,a.clone())

Compare method.
It would return a status 1 if all the data members of the class match with each other else it would be 0.
    status = a.compare(b)


Create method

Static Component of UVM - UVM Component.

UVM_TOP -> ROOT
Test
    Environment
        UVM_SCOREBOARD
        UVM_AGENT
            UVM_MONITOR
            UVM_DRIVER
            UVM_SEQUENCER

Registering to factory gives acces to all uvm_methods + the uvm_config_db.









Semiconductor Memory Basics

Registers are made from flip flops.
Memory chips or memories embedded in ASIC or FPGAs ,stores data in addressable storage elements organized in array format.
/2023-10-26-13-15-09.png
Array elements in a memory are accessible by the address bits. One row and One column would be selected and write/read would be done to it.
Flipflop consumes more transistors hence consumes more area and more cost.
Memory based storage function is slower than flip flop based implementation.


Memories can be classified as :
1) Read Only Memory(ROM)
2) Read/write memory(RAM random acces memroy)

Memory Organization of 16x4 means that there are 16 locations each of 4bit wide.
when address port is given input address then selected address is available at Data pins of memory.
Same data pins are muxed and used for write and data hence there is a pin READ/WRITE pin is available.
Also there is a chip select which enables the memory.


Programmable Read-Only Memory (ROM):
A MASK (MOS - Metal-Oxide-Semiconductor) Programmable Read-Only Memory (ROM) is a type of non-volatile memory that is programmed during the semiconductor manufacturing process and cannot be changed or reprogrammed once it's fabricated. 
These ROMs are called "mask programmable" because the data is physically encoded into the chip's structure using masks during the fabrication process. Here are some common uses of MASK Programmable ROMs.
Boot code and LUT .

Static RAM:
Static Ram are the one which holds there data as long as the power is available to them.
These are high speed memory .FPGA has lot of SRAMs  cache memory is one of important application.
Its a a asynchronous memory .  All the timing parameters and requirements of SRAM access is taken care by the memory controller.

Dynamic ram:
Data is stored in capacitors.
Large number of address line are needed here as the size of memory is big.
So here adress is given in two parts as column address and row address. So there are two signals CAS and RAS (column address strobe and row address strobe ).
DDR is the main memory of CPU .its seldom used in ASICs 

FPGA Memory Resources:
Programmable I/O Resources.
Hardwired blocks that implement arithmetic operations.
Configurable Logic Blocks 
Memory.
Block Rams (prefabricated of RAMs in fpga SRAMs)



I2C PROTOCOL  

2C Protocol Basics:
l
I2C is a widely used serial communication protocol that allows multiple devices to communicate over a shared bus.
It was developed by Philips (now NXP Semiconductors) and is now an industry standard.
I2C supports two-wire communication (SCL for the clock signal and SDA for the data signal) and alows multiple devices to be connected to the same bus.


Key Components:

Master: The device initiating communication on the I2C bus.
Slave: The device that responds to the master's commands.
SCL (Serial Clock): The clock signal generated by the master to synchronize data transmission.
SDA (Serial Data): The data line where information is transmitted bi-directionally.
Start Condition: The master initiates communication by generating a Start condition (S).

Data Transmission:

Data is transmitted in 8-bit bytes.
Each byte is followed by an acknowledgment bit (ACK/NACK) to indicate if the data was received successfully.
The master controls the clock signal, and data is transferred on the SDA line during clock pulses.
Communication Phases:

Start Condition: The master initiates communication by pulling SDA low while SCL is high, creating a Start condition.

Addressing: The master sends the 7-bit or 10-bit address of the target slave device after the Start condition. The 8th bit is the Read/Write bit (R/W) indicating whether data is being read from or written to the slave.

Data Transfer: Data bytes are transmitted between the master and the slave, one byte at a time. The sender (master or slave) transmits 8 bits, and the receiver acknowledges each byte.

Stop Condition: To end communication, the master generates a Stop condition (P) by releasing the SDA line while SCL is high.

Acknowledge (ACK) and Not-Acknowledge (NACK):

After receiving a byte, the receiver (master or slave) responds with an ACK or NACK bit.
An ACK (logical low) indicates that the receiver is ready for the next byte.
A NACK (logical high) indicates the end of data transfer.
I2C Modes:

Standard Mode (SM): Supports a maximum data rate of 100 Kbps.
Fast Mode (FM): Supports data rates of up to 400 Kbps.
High-Speed Mode (HSM): Supports data rates up to 3.4 Mbps.
Ultra-Fast Mode (UFM): Supports data rates up to 5 Mbps.
Multi-Master Configuration:

I2C can operate in multi-master mode, where multiple masters can access the bus. Collision detection and arbitration mechanisms are used to resolve conflicts.
I2C Applications:

I2C is commonly used for connecting sensors, EEPROMs, real-time clocks, and various other peripheral devices to microcontrollers and microprocessors.
It's also used in communication between components on a PCB.
I2C is a versatile and widely used communication protocol in embedded systems and offers a convenient way to connect and control various devices on a shared bus. Understanding the protocol's basics and how to work with it is essential for embedded system designers and engineers.

Feel free to use these notes for your reference when studying or working with the I2C protocol.


