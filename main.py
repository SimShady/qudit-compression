from os import listdir
from os.path import isfile, join
from processing import process_circuit

import clustering

circuits_dir = "circuits"
solutions_dir = "solutions"

circuit_files = [f for f in listdir(circuits_dir) if isfile(join(circuits_dir, f))]

for circuit_file in circuit_files:
    out_dir = join(solutions_dir, circuit_file[:-5])
    runs = process_circuit(join(circuits_dir, circuit_file), join(out_dir, "louvain"), clustering.louvain(modularity="dugue"), max_runs=2)
    print("processed file '%s' with algorithm louvain (dugue) in %d runs" % (circuit_file, runs))
    runs = process_circuit(join(circuits_dir, circuit_file), join(out_dir, "leiden"), clustering.leiden(modularity="dugue"), max_runs=2)
    print("processed file '%s' with algorithm leiden (dugue) in %d runs" % (circuit_file, runs))
    runs = process_circuit(join(circuits_dir, circuit_file), join(out_dir, "kcenters"), clustering.kcenters(mean_cluster_size=4))
    print("processed file '%s' with algorithm kcenters (mean_cluster_size 4) in %d runs" % (circuit_file, runs))