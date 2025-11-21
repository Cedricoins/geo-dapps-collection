'use client';
import { useState } from 'react';
import { useAccount, useWriteContract } from 'wagmi';
import { GEO_NFT_ABI } from '@/lib/contracts';

export default function GeoNFTPage() {
  const { address } = useAccount();
  const { writeContract } = useWriteContract();
  const [lat, setLat] = useState<number>(0);
  const [lng, setLng] = useState<number>(0);

  const getLocationAndMint = () => {
    navigator.geolocation.getCurrentPosition((pos) => {
      const latitude = Math.round(pos.coords.latitude * 1e6);
      const longitude = Math.round(pos.coords.longitude * 1e6);
      writeContract({
        address: '0xTonContratDéployé',
        abi: GEO_NFT_ABI,
        functionName: 'mintIfInParis',
        args: [latitude, longitude],
      });
    });
  };

  return (
    <div className="max-w-2xl mx-auto p-10 text-center">
      <h1 className="text-4xl mb-8">🗼 Geo NFT Paris</h1>
      <button onClick={getLocationAndMint} className="bg-pink-600 hover:bg-pink-700 px-10 py-6 rounded-full text-xl">
        Mint si tu es à Paris !
      </button>
    </div>
  );
}
