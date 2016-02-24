
const data      = "../data"
const simulated = joinpath(data, "simulated")
const real      = joinpath(data, "real")
const realbam   = joinpath(real,"bam")
const simbam    = joinpath(simulated,"bam")
const ref       = joinpath(data, "ref")

const varfile = joinpath(data,"variants.bed")
const inbam = joinpath(realbam, "069_gdna_sort.bam")
const hg19 = joinpath(ref, "ucsc.hg19.fasta")
const outbam = joinpath(simbam, "069_gdna_sort_sim.bam")

const snvfrac = 1
const mutfrac = 0.5
const numsnv  = 10
const coveragefile = joinpath(data,"coverage.bed") #todo
const haplosize = 2
const procs = 50
const picardjar = "/home/guo/haplxo/Github/picard-tools-1.131/picard.jar" 
const mindepth = 5
const maxdepth = 2000
const minmutreads = 4 #important threshold
#const avoidreads = 100
const maxopen = 1024
const aligner = "bwa"
const alignopts = ""

const varfile1 = joinpath(data,"variants_1.bed")
const outbam1 = joinpath(simbam, "069_gdna_sort_sim1.bam")

cmd1 = `addsnv.py -v $varfile1 -f $inbam -r $hg19 -o $outbam1
                 --tmpdir "/haplox/tmp" `
#=
cmd = `addsnv.py -v $varfile -f $inbam -r $hg19 -o $outbam -s $snvfrac
                 -m $mutfrac -n $numsnv -d $coveragefile -z $haplosize -p $procs
                 --picardjar $picardjar --mindepth $mindepth --maxdepth $maxdepth
                 --minmutreads $minmutreads --avoidreads $avoidreads --nomut
                 --ignoresnps  --maxopen $maxopen --requirepaired
                 --skipmerge --ignorepileup --aligner $aligner --alignopts $alignopts
                 --tmpdir "/haplox/tmp" `
=#
println("comand for addsnv.py is:")
println(cmd1)

run(cmd1)


