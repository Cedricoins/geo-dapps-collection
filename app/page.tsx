import Link from 'next/link';

const contracts = [
  { id: 1, name: "Geo Check-In", desc: "Check-in GPS simple" },
  { id: 2, name: "Geo NFT Paris", desc: "Mint NFT uniquement à Paris" },
  { id: 3, name: "Distance Bet", desc: "Pari sur distance parcourue" },
  { id: 4, name: "Geo Fencing", desc: "Accès zone restreinte" },
  { id: 5, name: "Proof of Location", desc: "Preuve décentralisée de localisation" },
  { id: 6, name: "Treasure Hunt", desc: "Chasse au trésor GPS" },
  { id: 7, name: "Geo Voting", desc: "Vote local anti-fraude" },
  { id: 8, name: "Geo Insurance", desc: "Assurance déclenchée par zone" },
  { id: 9, name: "Geo Delivery", desc: "Validation livraison par GPS" },
  { id: 10, name: "Carbon Credits", desc: "Crédits carbone éco-mobilité" },
];

export default function Home() {
  return (
    <main className="p-10">
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-7xl mx-auto">
        {contracts.map(c => (
          <Link key={c.id} href={`/contract/${c.id}`}>
            <div className="bg-white/10 backdrop-blur rounded-2xl p-8 hover:scale-105 transition-all border border-white/20">
              <h2 className="text-2xl font-bold mb-3">#{c.id} {c.name}</h2>
              <p className="opacity-80">{c.desc}</p>
            </div>
          </Link>
        ))}
      </div>
    </main>
  );
}
