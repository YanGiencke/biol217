library(readxl)
library(ggplot2)

sheet1 <- read_excel("csrA-WT_sorted.xlsx", sheet = "Sheet4")
plot1 <- ggplot(sheet1, aes(Seq_type, Name, fill=log2fold_change))+geom_tile() +
  ylab("Genes") +xlab("Sequencing Type")+ labs(fill="Change in log2") + ggtitle("Differential gene expression") + 
  geom_text(aes(label=Name))+theme(axis.text.y = element_blank()) + ggsave("Differential_gene_expression1.png")

plot1

ggsave("Differential_gene_expression1")


sheet2 <- read_excel("csrA-WT_sorted.xlsx", sheet = "Sheet3")
plot2 <- ggplot(sheet2, aes(Name, log2FC_TE_final))+geom_bar(stat = "identity") +
  xlab("Genes") +ylab("Change in log2")+ ggtitle("Differential gene expression") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
plot2

ggsave("Differential_gene_expression2.png")



sheet3 <- read_excel("csrA-WT_sorted.xlsx", sheet = "Sheet5")
plot3 <- ggplot(sheet3, aes(Seq_type, Identifier, fill=log2FC))+geom_tile()+
  ggtitle("Differential gene expression")+ylab("Genes") +xlab("Sequencing Type")+ 
  labs(fill="Change in log2")+theme(axis.text.y = element_blank())
plot3

ggsave("Differential_gene_expression3.png")

