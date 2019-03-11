from Spectrum_to_Ionization import *
print(get_filename('./Galactic_absorption','.txt'))
def add_notes(name):
    new_file = open(name.replace('.txt',''), 'w')
    with open(name,'r') as f:
        line = f.readlines()
        count = 0
        for line_list in line:
            if count<3:
                line_new = '# ' + line_list
            else:
                line_new = line_list.replace('D','E')
            count += 1
            new_file.write(line_new)
        new_file.close()
for n in get_filename('./Galactic_absorption','.txt'):
    add_notes(n)
ok()
