with huffman_pkg; use huffman_pkg;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

procedure code_strings is

   s:  Unbounded_String;
   f_table: Frequency_Table;
   h_table: Huffman_Table;

begin

   while not end_of_file loop

      s := get_line;

      New_Line;

      f_table := create_freq_table(To_String(s));
      h_table := create_huffman_table(To_String(s));

   end loop;

end code_strings;
