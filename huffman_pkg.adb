with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Containers.Generic_Array_Sort;
with Tree_Pkg;
package body huffman_pkg is

   type TreeArray is array (Natural range <>) of Tree;

   procedure sortArray(u: in out TreeArray) is

   ----------------------------------------------------------
   -- Purpose: Returns boolean based on the "lessThan" criteria
   -- Parameters: left, right: Tree
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   function lessThan(left, right: Tree) return boolean is
     (data(left).frequency < data(right).frequency or else
        (data(left).frequency = data(right).frequency and
          data(left).letter < data(right).letter));

   ----------------------------------------------------------
   -- Purpose: Sorting procedure for the array
   -- Parameters:
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   procedure sort is new ada.Containers.Generic_Array_Sort(

         Index_Type   => Natural,
          Element_Type => Tree,
          Array_Type   => TreeArray,
          "<"          => lessThan);
   begin
      sort(u);
   end sortArray;

    ----------------------------------------------------------
   -- Purpose: Returns a Tree based on the TreeArray given
   -- Parameters: arr: TreeArray
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   procedure makeTree(arr: TreeArray; complete: out Tree) is

      leastNode1: Tree;
      leastNode2: Tree;
      tempTree: Tree;
      newTree: Tree;
      newNode: NodeInfo;
      sortedArray: TreeArray (1..arr'Length) := arr;
      totalFreq: Natural;
      totalLetter: Unbounded_String;

   begin
      sortArray(sortedArray);

      if arr'Length > 1 then
         leastNode1 := sortedArray(1);
         leastNode2 := sortedArray(2);
         totalLetter := data(leastNode1).letter & data(leastNode2).letter;
         totalFreq := data(leastNode1).frequency + data(leastNode2).frequency;
         newNode.frequency := totalFreq;
         newNode.letter := totalLetter;

         complete := new_tree(newNode, leastNode1, leastNode2);

         sortedArray(2) := complete;

         makeTree(sortedArray(2..sortedArray'last), complete);
      end if;

   end makeTree;

   ----------------------------------------------------------
   -- Purpose: Returns the size of the given Frequency Table
   -- Parameters: f: Frequency_Table
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   function findSize (f: Frequency_Table) return Natural is
      count: Natural := 0;
   begin

      for a in Character'range loop
         if f(a) >= 1 then
            count := count + 1;
         end if;
      end loop;

      return count;

   end findSize;

   ----------------------------------------------------------
   -- Purpose: Prints the letter section of NodeInfo
   -- Parameters: n: NodeInfo
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   procedure put(n: NodeInfo) is
   begin
      put(to_String(n.letter));
      put(n.frequency);
      New_Line;
   end put;

   ----------------------------------------------------------
   -- Purpose: Returns a frequency table based on the given string
   -- Parameters: s: A_String
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   function create_freq_table (s : A_String) return Frequency_Table is
      temp_Freq_Table: Frequency_Table;
      tempChar: Character;
      tempNum: Natural;
   begin

      for z in Character'range loop
         temp_Freq_Table(z) := 0;
      end loop;

      for i in 1..s'last loop
         tempChar := s(i);
         tempNum := 0;

         for j in 1..s'last loop

            if tempChar = s(j) then
               tempNum := tempNum + 1;
            end if;

         end loop;

         temp_Freq_Table(tempChar) := tempNum;
      end loop;

      return temp_Freq_Table;
   end create_freq_table;

   ----------------------------------------------------------
   -- Purpose: Where all the caculations on the stacks are performed
   -- Parameters:
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   function create_huffman_table (s : A_String) return Huffman_Table is
      new_Huff_Table: Huffman_Table;
      new_Freq_Table: Frequency_Table := create_freq_table(s);
      size: Natural := findSize(new_Freq_Table);
      t_Array: TreeArray (1..size);
      newNode: NodeInfo;
      tempRoot: Tree;
      completeArr: Tree;
      index: Integer := 0;
   begin

      for b in new_Freq_Table'range loop

         if new_Freq_Table(b) >= 1 then
            newNode.frequency := new_Freq_Table(b);
            newNode.letter := To_Unbounded_String(b'img);
            index := index + 1;

            t_Array(index) := new_tree(newNode, Empty, Empty);
         end if;

      end loop;

      makeTree(t_Array, completeArr);

      put_pre_order(completeArr);

      return new_Huff_Table;

   end create_huffman_table;

   ----------------------------------------------------------
   -- Purpose: Where all the caculations on the stacks are performed
   -- Parameters:
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   function to_huffman (s: A_String; c: Huffman_Table; spaces: Boolean := false) return RH_String is
      temp_RH_String: RH_String := "";
   begin
      return temp_RH_String;
   end to_huffman;

   ----------------------------------------------------------
   -- Purpose: Where all the caculations on the stacks are performed
   -- Parameters:
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   function to_huffman (s: A_String; spaces: Boolean := false) return RH_String is
      temp_RH_String: RH_String := "";
   begin
      return temp_RH_String;
   end to_huffman;

   ----------------------------------------------------------
   -- Purpose: Where all the caculations on the stacks are performed
   -- Parameters:
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   function to_ascii(s: H_String; ft: Frequency_Table) return A_String is
      temp_A_String: A_String := "";
   begin
      return temp_A_String;
   end to_ascii;

end huffman_pkg;
