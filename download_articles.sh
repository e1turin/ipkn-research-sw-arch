#!/usr/bin/env bash
set -euo pipefail

OUTDIR="graph_pdfs"
ZIPNAME="archive_graph_architecture_pdfs.zip"
mkdir -p "$OUTDIR"

urls=(
"https://link.springer.com/chapter/10.1007/978-3-540-46464-8_33?utm_source=chatgpt.com"
"https://link.springer.com/chapter/10.1007/978-3-540-68679-8_4?utm_source=chatgpt.com"
"https://link.springer.com/chapter/10.1007/978-0-387-35563-4_8?utm_source=chatgpt.com"
"https://arxiv.org/abs/1706.09859?utm_source=chatgpt.com"
"https://www.researchgate.net/publication/336109064_Graph-based_Assessment_and_Analysis_of_System_Architecture_Models?utm_source=chatgpt.com"
"https://link.springer.com/chapter/10.1007/978-3-030-89022-3_17?utm_source=chatgpt.com"
"https://www.mdpi.com/2227-7394/10/5/759?utm_source=chatgpt.com"
"https://www.mdpi.com/2076-3417/12/11/5301?utm_source=chatgpt.com"
"https://onlinelibrary.wiley.com/doi/full/10.1002/eng2.12168?utm_source=chatgpt.com"
"https://arxiv.org/abs/2201.06363?utm_source=chatgpt.com"
"https://arxiv.org/abs/2207.02988?utm_source=chatgpt.com"
"https://arxiv.org/abs/2301.02723?utm_source=chatgpt.com"
"https://www.lirmm.fr/~tibermacin/papers/2023/JVetAl_DEM_2023.pdf?utm_source=chatgpt.com"
"https://www.researchgate.net/publication/380421763_Bridging_the_Gap_Leveraging_Informal_Software_Architecture_Artifacts_for_Structured_Model_Creation?utm_source=chatgpt.com"
"https://www.mdpi.com/2078-2489/15/10/642?utm_source=chatgpt.com"
"https://taoxie.cs.illinois.edu/publications/esecfse20in-trace.pdf?utm_source=chatgpt.com"
"https://www.researchgate.net/publication/4036776_On_Modeling_Software_Architecture_Recovery_as_Graph_Matching?utm_source=chatgpt.com"
"https://research.utwente.nl/files/6039693/thesis_Kastenberg-versie_2.pdf?utm_source=chatgpt.com"
"https://www.graphviz.org/documentation/GN99.pdf?utm_source=chatgpt.com"
"https://www2.cs.arizona.edu/~kobourov/tgrip.pdf?utm_source=chatgpt.com"
"https://www.researchgate.net/publication/364658772_An_Approach_to_Build_Consistent_Software_Architecture_Diagrams_Using_Devops_System_Descriptors?utm_source=chatgpt.com"
"https://journalofbigdata.springeropen.com/counter/pdf/10.1186/s40537-023-00876-4.pdf?utm_source=chatgpt.com"
"https://www.researchgate.net/publication/394268736_Graph-Based_Structural_Analysis_of_Service-Oriented_and_Microservice_Architecture_Using_Service_and_Task_Graphs?utm_source=chatgpt.com"
"https://ceur-ws.org/Vol-3662/paper11.pdf?utm_source=chatgpt.com"
"https://research.vu.nl/files/302229951/SATrends_2024_ArchitectureKnowledgeGraphs_-_camera_ready.pdf?utm_source=chatgpt.com"
)

i=1
for u in "${urls[@]}"; do
  echo "Downloading ($i/${#urls[@]}): $u"
  # make a safe filename
  fname="$OUTDIR/doc_$(printf "%03d" $i).pdf"
  # try wget first; if it returns HTML (redirect page), still save: user can open and decide
  wget -q -O "$fname" "$u" || { echo "wget failed for $u"; }
  i=$((i+1))
done

echo "Creating ZIP: $ZIPNAME"
zip -r "$ZIPNAME" "$OUTDIR"
echo "Done. Archive: $ZIPNAME"
